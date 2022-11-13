//
//  Hash+SHA256.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/8.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import CryptoKit
import CommonCrypto

public extension MQCrypto {
    
    static func sha256(_ data: Data) -> Data {
        if #available(iOS 13.0, *) {
            var hash = SHA256()
            hash.update(data: data)
            return Data(hash.finalize())
        }
        
        return data.withUnsafeBytes { ptr in
            guard let dataPtr = ptr.baseAddress else { return Data() }
            
            let length = Int(CC_SHA256_DIGEST_LENGTH)
            let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: length)
            
            CC_SHA256(dataPtr, CC_LONG(data.count), optPtr)
            return Data(bytes: optPtr, count: length)
        }
    }
}
