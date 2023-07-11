//
//  AES+CBC.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import CommonCrypto

public extension MQCrypto.AES {
    
    struct CBC {}
}

public extension MQCrypto.AES.CBC {
    
    static func encrypt(
        _ plaintext: Data,
        key: Data,
        iv: Data? = nil,
        padding: MQCrypto.Padding = .pkcs7
    ) -> Data? {
        let blockSize = MQCrypto.AES.blockSize
        let iptData = padding.padding(data: plaintext, blockSize: blockSize)
        
        let ivPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: blockSize)
        defer { free(ivPtr) }
        iv?.copyBytes(to: ivPtr, count: min(iv?.count ?? 0, blockSize))
        
        let optCount = iptData.count + blockSize
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: optCount)
        defer { free(optPtr) }
        
        do {
            try MQCrypto.CCCrypt(
                op: .encrypt, alg: .aes,
                options: .pkcs7Padding,
                key: key,
                iv: ivPtr,
                dataIn: plaintext,
                dataOut: optPtr, dataOutAvailavle: optCount
            )
            return Data(bytes: optPtr, count: iptData.count)
        } catch { return nil }
    }
    
    static func decrypt(
        _ ciphertext: Data,
        key: Data,
        iv: Data? = nil,
        padding: MQCrypto.Padding = .pkcs7
    ) -> Data? {
        let blockSize = MQCrypto.AES.blockSize
        
        let ivPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: blockSize)
        defer { free(ivPtr) }
        iv?.copyBytes(to: ivPtr, count: min(iv?.count ?? 0, blockSize))
        
        let optCount = ciphertext.count + blockSize
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: optCount)
        defer { free(optPtr) }
        
        guard var moved = try? MQCrypto.CCCrypt(
            op: .decrypt, alg: .aes,
            options: .pkcs7Padding,
            key: key,
            iv: ivPtr,
            dataIn: ciphertext,
            dataOut: optPtr, dataOutAvailavle: optCount
        ) else { return nil }
        
        switch padding {
        case .zero:
            while moved > 0 && optPtr[moved-1] == 0 {
                moved -= 1
            }
        case .pkcs7:
            break
        }
        
        return Data(bytes: optPtr, count: moved)
    }
}
