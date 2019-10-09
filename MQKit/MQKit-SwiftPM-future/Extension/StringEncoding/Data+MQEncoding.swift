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
        guard let model = try? MQGarbledCheckerModel() else {
            return .init()
        }
        
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
        let setterQue = OperationQueue.mq_single
        
        var localEncodingAry: [String.Encoding] = []
        DispatchQueue.concurrentPerform(iterations: encodingAry.count) { (i) in
            let encoding = encodingAry[i]
            guard let tsStr = String(data: stData, encoding: encoding) else {
                return
            }
            
            guard model.isNormal(tsStr, usePrivateUseArea: false) else {
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
                    let subTxt = txt.mq_substring(with: st..<ed)
                    
                    guard model.isNormal(subTxt) else {
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
