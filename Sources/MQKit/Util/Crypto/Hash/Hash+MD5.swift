//
//  Hash+MD5.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/8.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import CryptoKit
import CommonCrypto

public extension Crypto {
    
    static func md5(_ data: Data) -> Data {
        if #available(iOS 13.0, *) {
            let opt = Insecure.MD5.hash(data: data)
            return Data(opt)
        }
        
        return data.withUnsafeBytes { ptr in
            guard let dataPtr = ptr.baseAddress else { return Data() }
            
            let length = Int(CC_MD5_DIGEST_LENGTH)
            let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: length)
            
            CC_MD5(dataPtr, CC_LONG(data.count), optPtr)
            return Data(bytesNoCopy: optPtr, count: length, deallocator: .free)
        }
    }
}
