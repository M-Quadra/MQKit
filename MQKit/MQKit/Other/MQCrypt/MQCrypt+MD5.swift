//
//  MQCrypt+MD5.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation
import CommonCrypto

extension MQCrypt {
    
    struct MD5 {
        
        static func encrypt(data: Data, bits: Int = 128) -> Data {
            if data.count <= 0 {
                return Data()
            }
            
            var srcData = data
            let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(&srcData, CC_LONG(data.count), buffer)
            
            let opt = Data(bytes: buffer, count: Int(CC_MD5_DIGEST_LENGTH))
            free(buffer)
            
            if bits/8 == Int(CC_MD5_DIGEST_LENGTH) {
                return opt
            }
            return opt[4..<12]
        }
        
        /// hex string
        static func encrypt(str: String,
                            hexLenght: Int = 32, uppercased: Bool = false,
                            using: String.Encoding = .utf8
            ) -> String {
            guard let data = str.data(using: using) else {
                return ""
            }
            
            let md5Data = self.encrypt(data: data, bits: hexLenght*4)
            guard md5Data.count*8 == hexLenght*4 else {
                return ""
            }
            
            let opt = md5Data.map {
                String(format: uppercased ? "%02X" : "%02x", $0)
            }.joined()
            return opt
        }
    }
}

