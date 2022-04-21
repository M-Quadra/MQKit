//
//  Data+MD5.swift
//  MQKit
//
//  Created by M_Quadra on 2020/8/28.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Foundation
import CryptoKit
import CommonCrypto

extension Data {
    
    /// 32hex lowercased
    public var mq_MD5: String {
        guard !self.isEmpty else { return "" }
        
        if #available(iOS 13.0, *) {
            return Insecure.MD5.hash(data: self).map {
                String(format: "%02hhx", $0)
            }.joined()
        }
        
        let dataPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        let mdPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        self.copyBytes(to: dataPtr, count: self.count)
        CC_MD5(dataPtr, CC_LONG(self.count), mdPtr)
        
        let opt = Data(bytes: mdPtr, count: Int(CC_MD5_DIGEST_LENGTH))
        free(mdPtr)
        free(dataPtr)
        
        return opt.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
