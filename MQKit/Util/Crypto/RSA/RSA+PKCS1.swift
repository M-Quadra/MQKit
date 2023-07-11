//
//  RSA+PKCS1.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/12.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import Security

public extension MQCrypto.RSA {
    
    struct PKCS1 {}
}

public extension MQCrypto.RSA.PKCS1 {
    
    static func encrypt(_ plaintext: Data, publicKey keyData: Data) -> Data? {
        guard let pubKey = MQCrypto.RSA.publicKey(keyData),
              SecKeyIsAlgorithmSupported(pubKey, .encrypt, .rsaEncryptionPKCS1)
        else { return nil }
        
        let blockSize = SecKeyGetBlockSize(pubKey)
        var opt = Data(capacity: (plaintext.count+blockSize-1)/blockSize*blockSize)
        
        var i = 0
        while i < plaintext.count {
            let block = plaintext[i..<min(i+blockSize, plaintext.count)] as CFData
            guard let data = SecKeyCreateEncryptedData(pubKey, .rsaEncryptionPKCS1, block, nil) as? Data
            else { return nil }
            
            opt.append(data)
            i += blockSize
        }
        
        return opt
    }
    
    static func decrypt(_ ciphertext: Data, privateKey keyData: Data) -> Data? {
        guard let pvtKey = MQCrypto.RSA.privateKey(keyData),
              SecKeyIsAlgorithmSupported(pvtKey, .decrypt, .rsaEncryptionPKCS1)
        else { return nil }
        
        var opt = Data(capacity: ciphertext.count)
        
        var i = 0
        let blockSize = SecKeyGetBlockSize(pvtKey)
        while i < ciphertext.count {
            let block = ciphertext[i..<min(i+blockSize, ciphertext.count)] as CFData
            guard let data = SecKeyCreateDecryptedData(pvtKey, .rsaEncryptionPKCS1, block, nil) as? Data
            else { return nil }
            
            opt.append(data)
            i += blockSize
        }
        
        return opt
    }
    
    static func sign(_ plaintext: Data, privateKey keyData: Data, hash: MQCrypto.RSA.Hash = .sha256) -> Data? {
        var algo: SecKeyAlgorithm = .rsaSignatureDigestPKCS1v15Raw
        var hashed = plaintext
        switch hash {
        case .raw: break
        case .sha256:
            algo = .rsaSignatureDigestPKCS1v15SHA256
            hashed = MQCrypto.sha256(plaintext)
        }
        
        guard let pvtKey = MQCrypto.RSA.privateKey(keyData),
              SecKeyIsAlgorithmSupported(pvtKey, .sign, algo)
        else { return nil }
        
        let blockSize = SecKeyGetBlockSize(pvtKey)
        var opt = Data(capacity: (hashed.count+blockSize-1)/blockSize*blockSize)
        
        var i = 0
        while i < hashed.count {
            let block = hashed[i..<min(i+blockSize, hashed.count)] as CFData
            guard let data = SecKeyCreateSignature(pvtKey, algo, block, nil) as? Data
            else { return nil }
            
            opt.append(data)
            i += blockSize
        }
        
        return opt
    }
    
    static func verify(_ plaintext: Data, publicKey keyData: Data, signature: Data, hash: MQCrypto.RSA.Hash = .sha256) -> Bool {
        var algo: SecKeyAlgorithm = .rsaSignatureDigestPKCS1v15Raw
        var hashed = plaintext
        switch hash {
        case .raw: break
        case .sha256:
            algo = .rsaSignatureDigestPKCS1v15SHA256
            hashed = MQCrypto.sha256(plaintext)
        }
        
        guard let pubKey = MQCrypto.RSA.publicKey(keyData),
              SecKeyIsAlgorithmSupported(pubKey, .verify, algo)
        else { return false }
        
        let blockSize = SecKeyGetBlockSize(pubKey)
        var i = 0
        while i < hashed.count {
            let signedData = hashed[i..<min(i+blockSize, hashed.count)] as CFData
            
            if !(signature.indices ~= i) { return false }
            if !SecKeyVerifySignature(pubKey, algo, signedData, signature[i..<min(i+blockSize, signature.count)] as CFData, nil) { return false }
            
            i += blockSize
        }
        
        return true
    }
}
