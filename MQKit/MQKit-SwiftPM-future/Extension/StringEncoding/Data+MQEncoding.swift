//
//  Data+MQEncoding.swift
//  MQKit
//
//  Created by M_Quadra on 2019/9/26.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
extension Data {
    
    struct MQEncodingResult {
        var encoding: String.Encoding? = nil
        var cacheText: String? = nil
    }
    
    var mq_autoEncoding: MQEncodingResult {
        var stData = self
        let flagSet: Set<UInt8> = [10, 13, 32]
        
        if self.count > 200 {
            for i in 190..<self.count {
                if !flagSet.contains(self[i]) {
                    continue
                }
                
                stData = self[0..<i]
                break
            }
        }
        
        let cfEncodingsAry = CFStringEncodings.mq_AllValues.map { $0.mq_StringEncoding }
        let encodingAry = String.Encoding.mq_allValues + cfEncodingsAry
        
        // local encoding check
        // 局部编码检查
        let checker = MQGarbledChecker()
        let setterQue = OperationQueue.mq_single
        
        var localEncodingAry: [String.Encoding] = []
        DispatchQueue.concurrentPerform(iterations: encodingAry.count) { (i) in
            let encoding = encodingAry[i]
            guard var tsStr = String(data: stData, encoding: encoding) else {
                return
            }
            tsStr = tsStr.replacingOccurrences(of: "\r", with: "")
            tsStr = tsStr.replacingOccurrences(of: "\n", with: "")
            tsStr = tsStr.replacingOccurrences(of: " ", with: "")
            
            let strCnt = Double(tsStr.count)
            let utf16Cnt = Double(tsStr.utf16.count)
            let info = tsStr.mq_wordInfo
            
            let checkerOpt = try? checker.prediction(strCnt: strCnt,
                                                     utf16Cnt: utf16Cnt,
                                                     wordSetCnt: Double(info.wordSet.count),
                                                     maxWordStrCnt: Double(info.maxWordStringCount),
                                                     minWordStrCnt: Double(info.minWordStringCount),
                                                     privateUseAreaCnt: 0)
            guard checkerOpt?.isNormal == 1 else {
                return
            }
            
            setterQue.addOperation {
                localEncodingAry.append(encoding)
            }
        }
        setterQue.waitUntilAllOperationsAreFinished()
        
        #if DEBUG
        print("[MQKit] mq_autoEncoding first check over. count:", localEncodingAry.count)
        #endif
        
        var opt = MQEncodingResult()
        if localEncodingAry.count == 1, let encoding = localEncodingAry.first {
            opt.encoding = encoding
            return opt
        }
        if localEncodingAry.count == 0 {
            return opt
        }
        
        // 私用区(都用私用区了, 还猜啥编码？)
        // 文本有小概率混入私用区字符, 下面的检查取2/3概率
        let privateUseAreaRange = 0xE000...0xF8FF
        
        let opQue = OperationQueue.mq_max
        for encoding in localEncodingAry {
            opQue.addOperation {
                guard let txt = String(data: self, encoding: encoding) else {
                    return
                }
                
                let len = 100
                var normalCnt = 0
                
                DispatchQueue.concurrentPerform(iterations: 3) { (_) in
                    let st = Int(arc4random())%(txt.mq_count - len)
                    let ed = st + (Int(arc4random())%len)
                    var subTxt = txt.mq_substring(with: st..<ed)
                    subTxt = subTxt.replacingOccurrences(of: "\r", with: "")
                    subTxt = subTxt.replacingOccurrences(of: "\n", with: "")
                    subTxt = subTxt.replacingOccurrences(of: " ", with: "")

                    let strCnt = Double(subTxt.mq_count)
                    let utf16Cnt = Double(subTxt.utf16.count)
                    let info = subTxt.mq_wordInfo
                    var privateUseAreaCnt = 0

                    for code in subTxt.utf16 {
                        if privateUseAreaRange.contains(Int(code)) {
                            privateUseAreaCnt += 1
                        } else if code == 0x00A0 {// 无中断空格(拉丁文补充1)
                            privateUseAreaCnt += 1
                        }
                    }

                    let checkerOpt = try? checker.prediction(strCnt: strCnt,
                                                             utf16Cnt: utf16Cnt,
                                                             wordSetCnt: Double(info.wordSet.count),
                                                             maxWordStrCnt: Double(info.maxWordStringCount),
                                                             minWordStrCnt: Double(info.minWordStringCount),
                                                             privateUseAreaCnt: Double(privateUseAreaCnt))

                    guard checkerOpt?.isNormal == 1 else {
                        return
                    }

                    setterQue.addOperation {
                        normalCnt += 1
                        guard normalCnt == 2 else {
                            return
                        }

                        opQue.cancelAllOperations()
                        opt.encoding = encoding
                        opt.cacheText = txt
                    }
                }
            }
        }
        
        opQue.waitUntilAllOperationsAreFinished()
        setterQue.waitUntilAllOperationsAreFinished()
        
        return opt
    }
    
    public var mq_autoString: String? {
        let result = self.mq_autoEncoding
        guard let encoding = result.encoding else {
            return nil
        }
        
        if let cacheText = result.cacheText {
            return cacheText
        }
        return String(data: self, encoding: encoding)
    }
}
