//
//  RSA+Raw.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/13.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension Crypto.RSA { struct Raw {
}}

public extension Crypto.RSA.Raw {
    
    static func decrypt(_ ciphertext: Data, publicKey keyData: Data) -> Data? {
        guard let pvtKey = Crypto.RSA.publicKey(keyData),
              SecKeyIsAlgorithmSupported(pvtKey, .decrypt, .rsaEncryptionRaw)
        else { return nil }
        
        var opt = Data(capacity: ciphertext.count)
        
        var i = 0
        let blockSize = SecKeyGetBlockSize(pvtKey)
        while i < ciphertext.count {
            let block = ciphertext[i..<min(i+blockSize, ciphertext.count)] as CFData
            guard let subData = SecKeyCreateDecryptedData(pvtKey, .rsaEncryptionRaw, block, nil) as? Data,
                  let st = subData.lastIndex(of: 0)
            else { return nil }
            
            opt.append(subData[(st+1)...])
            i += blockSize
        }
        
        return opt
    }
}
