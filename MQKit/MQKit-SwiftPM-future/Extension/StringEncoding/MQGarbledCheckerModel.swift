//
//  MQGarbledCheckerModel.swift
//  MQKit
//
//  Created by M_Quadra on 2019/10/9.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation
import CoreML

@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class MQGarbledCheckerModel {
    
    // 私用区(都用私用区了, 还猜啥编码？)
    // 文本有小概率混入私用区字符, 最终检查取2/3概率
    let privateUseAreaRange = 0xE000...0xF8FF
    let model: MQGarbledChecker
    
    enum initError: Error {
        case modelPathError
        case modelCompileError
        case modelInitError
    }
    
    init() throws {
        let bundle = Bundle(for: MQGarbledChecker.self)
        if bundle.url(forResource: "MQGarbledChecker", withExtension:"mlmodelc") != nil {
            self.model = MQGarbledChecker()
            return
        }
        
        guard let modelPath = bundle.path(forResource: "MQGarbledChecker", ofType: "mlmodel") else {
            throw initError.modelPathError
        }
        
        let modelURL = URL(fileURLWithPath: modelPath)
        guard let mlmodelcURL = try? MLModel.compileModel(at: modelURL) else {
            throw initError.modelCompileError
        }
        guard let model = try? MQGarbledChecker.init(contentsOf: mlmodelcURL) else {
            throw initError.modelInitError
        }
        
        self.model = model
    }
    
    public func isNormal(_ text: String, usePrivateUseArea: Bool = true) -> Bool {
        var subTxt = text.replacingOccurrences(of: "\r", with: "")
        subTxt = subTxt.replacingOccurrences(of: "\n", with: "")
        subTxt = subTxt.replacingOccurrences(of: " ", with: "")
        
        let strCnt = Double(subTxt.mq_count)
        let utf16Cnt = Double(subTxt.utf16.count)
        let info = subTxt.mq_wordInfo
        var privateUseAreaCnt = 0
        var asciiCnt = 0
        
        for code in subTxt.utf16 {
            if code <= 127 {
                asciiCnt += 1
            }
            
            if usePrivateUseArea {
                if privateUseAreaRange.contains(Int(code)) {
                    privateUseAreaCnt += 1
                } else if code == 0x00A0 {// 无中断空格(拉丁文补充1)
                    privateUseAreaCnt += 1
                }
            }
        }
        
        if asciiCnt == subTxt.utf16.count {
            return true
        }
        
        let checkerOpt = try? model.prediction(strCnt: strCnt,
                                               utf16Cnt: utf16Cnt,
                                               wordSetCnt: Double(info.wordSet.count),
                                               maxWordStrCnt: Double(info.maxWordStringCount),
                                               minWordStrCnt: Double(info.minWordStringCount),
                                               privateUseAreaCnt: Double(privateUseAreaCnt))
        
        guard checkerOpt?.isNormal == 1 else {
            return false
        }
        
        return true
    }
}
