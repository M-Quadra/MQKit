//
//  AES+GCM.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/8.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import CryptoKit

@available(iOS 13.0, *)
public extension MQCrypto.AES {
    
    struct GCM {
        static let standardNonceSize = 12
        static let tagSize = 16
    }
}

@available(iOS 13.0, *)
public extension MQCrypto.AES.GCM {
    
    /// nonce + ciphertext + tag
    static func encrypt(_ plaintext: Data, key: Data) -> Data? {
        guard let box = try? AES.GCM.seal(plaintext, using: SymmetricKey(data: key)) else { return nil }
        
        let nonceCount = box.nonce.withUnsafeBytes { $0.count }
        let ciphertextCount = box.ciphertext.withUnsafeBytes { $0.count }
        let tagCount = box.tag.withUnsafeBytes { $0.count }
        let count = nonceCount + ciphertextCount + tagCount
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: count)
        
        box.nonce.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { return }
            memcpy(optPtr, src, ptr.count)
        }
        box.ciphertext.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { return }
            memcpy(optPtr + nonceCount, src, ptr.count)
        }
        box.tag.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { return }
            memcpy(optPtr + nonceCount + ciphertextCount, src, ptr.count)
        }
        
        return Data(bytesNoCopy: optPtr, count: count, deallocator: .free)
    }
    
    /// nonce + ciphertext + tag
    static func decrypt(_ ciphertext: Data, key: Data) -> Data? {
        if ciphertext.count < standardNonceSize+tagSize { return nil }
        
        let nonce = ciphertext[0..<12]
        let cipher = ciphertext[12..<(ciphertext.count - 16)]
        let tag = ciphertext[(ciphertext.count - 16)...]
        
        guard let nonce = try? AES.GCM.Nonce(data: nonce),
              let box = try? AES.GCM.SealedBox(
                nonce: nonce,
                ciphertext: cipher,
                tag: tag
              ),
              let opt = try? AES.GCM.open(box, using: SymmetricKey(data: key))
        else { return nil }
        return opt
    }
}
