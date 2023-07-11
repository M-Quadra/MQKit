//
//  MQKeychain.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/17.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

fileprivate func queryWith(key: String) -> [CFString: Any] {
    return [
        kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
        kSecAttrAccount:    key,
        kSecAttrService:    key,
        kSecClass:          kSecClassGenericPassword,
    ]
}

struct MQKeychain {
    
    static func set(key: String, value: Data?) {
        var query = queryWith(key: key)
        SecItemDelete(query as CFDictionary)
        guard let nValue = value else {
            return
        }
        query[kSecValueData] = nValue
        
        var result: CFTypeRef?
        let status = SecItemAdd(query as CFDictionary, &result)
        
        #if DEBUG
        guard status == noErr else {
            print("Keychain add", [key: value], "Error:", status)
            return
        }
        print("Keychain add", [key: value], "Sucess")
        #endif
    }
    
    static func set(key: String, value: String) {
        let data = value.data(using: .utf8)
        self.set(key: key, value: data)
    }
    
    static func search(key: String) -> Data? {
        var query = queryWith(key: key)
        query[kSecReturnData] = kCFBooleanTrue
        query[kSecMatchLimit] = kSecMatchLimitOne
        
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        guard status == noErr, let data = result as? Data else {
            return nil
        }
        return data
    }
    
    static func search(stringKey: String) -> String {
        guard let data = self.search(key: stringKey) else {
            return ""
        }
        guard let str = String(data: data, encoding: .utf8) else {
            return ""
        }
        
        return str
    }
    
    static func clear() {
        let secItemAry = [
            kSecClassInternetPassword,
            kSecClassGenericPassword,
            kSecClassCertificate,
            kSecClassKey,
            kSecClassIdentity
        ]
        
        for secItem in secItemAry {
            let dic = [kSecClass: secItem]
            let status = SecItemDelete(dic as CFDictionary)
            
            #if DEBUG
            guard status == noErr else {
                print("Keychain Clear", dic, "Error:", status)
                continue
            }
            print("Keychain Clear", dic, "Sucess")
            #endif
        }
    }
}
