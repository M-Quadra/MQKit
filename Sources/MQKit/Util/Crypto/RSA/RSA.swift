//
//  RSA.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/12.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension Crypto { struct RSA {
    fileprivate init() {}
}}

public extension Crypto.RSA { enum Hash {
    case raw
    case sha256
}}

public extension Crypto.RSA {
    
    static func publicKey(_ keyData: Data) -> SecKey? {
        let attDic: [CFString : Any] = [
            kSecAttrKeyType:       kSecAttrKeyTypeRSA,
            kSecAttrKeyClass:      kSecAttrKeyClassPublic,
            kSecAttrKeySizeInBits: keyData.count * 8,
        ]
        
        var err: Unmanaged<CFError>?
        guard let key = SecKeyCreateWithData(keyData as CFData, attDic as CFDictionary, &err),
              err == nil
        else { return nil }
        return key
    }
    
    static func privateKey(_ keyData: Data) -> SecKey? {
        let attDic: [CFString : Any] = [
            kSecAttrKeyType:       kSecAttrKeyTypeRSA,
            kSecAttrKeyClass:      kSecAttrKeyClassPrivate,
            kSecAttrKeySizeInBits: keyData.count * 8,
        ]
        
        var err: Unmanaged<CFError>?
        guard let key = SecKeyCreateWithData(keyData as CFData, attDic as CFDictionary, &err),
              err == nil
        else { return nil }
        return key
    }
}
