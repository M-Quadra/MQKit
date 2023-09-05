//
//  TripleDES+CBC.swift
//  
//
//  Created by m_quadra on 2023/9/5.
//

import Foundation
import CommonCrypto

public extension Crypto.TripleDES { struct CBC {
    fileprivate init() {}
}}

public extension Crypto.TripleDES.CBC {
    
    static func encrypt(
        _ plaintext: Data,
        key: Data,
        iv: Data? = nil,
        padding: Crypto.Padding = .pkcs7
    ) -> Data? {
        if key.count != kCCKeySize3DES { return nil }
        let blockSize = Crypto.TripleDES.blockSize
        let iptData = padding.padding(data: plaintext, blockSize: blockSize)
        
        let ivPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: blockSize)
        defer { free(ivPtr) }
        iv?.copyBytes(to: ivPtr, count: min(iv?.count ?? 0, blockSize))
        
        let optCount = iptData.count + blockSize
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: optCount)
        defer { free(optPtr) }
        
        do {
            try Crypto.CCCrypt(
                op: .encrypt, alg: .tripleDES,
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
        padding: Crypto.Padding = .pkcs7
    ) -> Data? {
        if key.count != kCCKeySize3DES { return nil }
        let blockSize = Crypto.TripleDES.blockSize
        
        let ivPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: blockSize)
        defer { free(ivPtr) }
        iv?.copyBytes(to: ivPtr, count: min(iv?.count ?? 0, blockSize))
        
        let optCount = ciphertext.count + blockSize
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: optCount)
        defer { free(optPtr) }
        
        guard var moved = try? Crypto.CCCrypt(
            op: .decrypt, alg: .tripleDES,
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
