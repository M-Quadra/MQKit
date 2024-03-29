//
//  AES+ECB.swift
//  
//
//  Created by m_quadra on 2023/8/28.
//

import Foundation
import CommonCrypto

public extension Crypto.AES { struct ECB {
    fileprivate init() {}
}}

public extension Crypto.AES.ECB {
    
    static func encrypt(
        _ plaintext: Data,
        key: Data,
        padding: Crypto.Padding = .pkcs7
    ) -> Data? {
        let blockSize = Crypto.AES.blockSize
        let iptData = padding.padding(data: plaintext, blockSize: blockSize)
        
        let optCount = iptData.count + blockSize
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: optCount)
        defer { free(optPtr) }
        
        do {
            try Crypto.CCCrypt(
                op: .encrypt, alg: .aes,
                options: [.pkcs7Padding, .ecbMode],
                key: key,
                iv: nil,
                dataIn: plaintext,
                dataOut: optPtr, dataOutAvailavle: optCount
            )
            return Data(bytes: optPtr, count: iptData.count)
        } catch { return nil }
    }
    
    static func decrypt(
        _ ciphertext: Data,
        key: Data,
        padding: Crypto.Padding = .pkcs7
    ) -> Data? {
        let blockSize = Crypto.AES.blockSize
        
        let optCount = ciphertext.count + blockSize
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: optCount)
        defer { free(optPtr) }
        
        guard var moved = try? Crypto.CCCrypt(
            op: .decrypt, alg: .aes,
            options: [.pkcs7Padding, .ecbMode],
            key: key,
            iv: nil,
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
