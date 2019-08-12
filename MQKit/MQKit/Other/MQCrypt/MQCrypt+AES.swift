//
//  MQCrypt+AES.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation
import CommonCrypto

extension MQCrypt {
    
    struct AES128 {
        
        /// base64 String
        static func encrypt(data strIn: String, key: String, vi: String? = nil) -> String {
            guard let strInData = Data(base64Encoded: strIn) else {
                return ""
            }
            guard let keyData = Data(base64Encoded: key) else {
                return ""
            }
            
            var viData: Data?
            if let nowVi = vi {
                viData = Data(base64Encoded: nowVi)
            }
            
            let opt = self.encrypt(data: strInData, key: keyData, vi: viData)
            return opt.base64EncodedString()
        }
        
        /// ECB: vi == nil, CBC: vi != nil
        static func encrypt(data dataIn: Data, key: Data, vi: Data? = nil) -> Data {
            //使用.withUnsafeBytes { $0.baseAddress } 可能会出现数据异常, 无法还原原始Data, 原因未知
            //因此这里均使用.copyBytes
            let c_dataIn = UnsafeMutablePointer<UInt8>.allocate(capacity: dataIn.count)
            dataIn.copyBytes(to: c_dataIn, count: dataIn.count)
            
            let c_key = UnsafeMutablePointer<UInt8>.allocate(capacity: 128/8)
            key.copyBytes(to: c_key, count: min(key.count, 128/8))
            
            var c_vi = UnsafeMutablePointer<UInt8>(nil)
            var options = CCOptions(kCCOptionPKCS7Padding | kCCOptionECBMode)
            
            if let nowVi = vi {
                c_vi = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
                nowVi.copyBytes(to: c_vi!, count: min(nowVi.count, 16))
                options = CCOptions(kCCOptionPKCS7Padding)
            }
            
            let dataOutAvaliable = dataIn.count + kCCBlockSizeAES128
            let c_dataOut = UnsafeMutablePointer<UInt8>.allocate(capacity: dataOutAvaliable)
            var dataOutMoved = 0
            
            let result = CCCrypt(CCOperation(kCCEncrypt),
                                 CCAlgorithm(kCCAlgorithmAES),
                                 options,
                                 c_key, kCCBlockSizeAES128, c_vi,
                                 c_dataIn, dataIn.count,
                                 c_dataOut, dataOutAvaliable, &dataOutMoved)
            
            var optData = Data()
            if result == kCCSuccess {
                optData = Data(bytes: c_dataOut, count: dataOutMoved)
            }
            
            free(c_dataIn)
            free(c_key)
            free(c_dataOut)
            if c_vi != nil {
                free(c_vi)
            }
            
            return optData
        }
    }
}
