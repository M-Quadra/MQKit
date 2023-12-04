//
//  PKCS12.swift
//  
//
//  Created by m_quadra on 2023/12/4.
//

import Foundation

public extension Crypto { struct PKCS12 {
    fileprivate init() {}
}}

public extension Crypto.PKCS12 { struct Item {
    
    public let identity: SecIdentity?
    public let trust: SecTrust?
    public let certChain: [SecCertificate]
    
    init(_ dic: [CFString : Any]) {
        if let cfRef = dic[kSecImportItemIdentity] as? CFTypeRef,
           CFGetTypeID(cfRef) == SecIdentityGetTypeID() {
            self.identity = (cfRef as! SecIdentity)
        } else {
            self.identity = nil
        }
        
        if let cfRef = dic[kSecImportItemTrust] as? CFTypeRef,
           CFGetTypeID(cfRef) == SecTrustGetTypeID() {
            self.trust = (cfRef as! SecTrust)
        } else {
            self.trust = nil
        }
        
        if let arr = dic[kSecImportItemCertChain] as? [SecCertificate] {
            self.certChain = arr
        } else {
            self.certChain = []
        }
    }
}}

public extension Crypto.PKCS12 {
    
    static func parse(_ pfxData: Data, password: String) -> [Crypto.PKCS12.Item] {
        var items: CFArray?
        let status = SecPKCS12Import(pfxData as CFData, [
            kSecImportExportPassphrase: password,
        ] as CFDictionary, &items)
        guard status == errSecSuccess,
              let items = items as? [[CFString: Any]]
        else { return [] }
        
        return items.map { Crypto.PKCS12.Item($0) }
    }
}
