//
//  TripleDES.swift
//  
//
//  Created by m_quadra on 2023/9/5.
//

import Foundation
import CommonCrypto

public extension Crypto { struct TripleDES {
    fileprivate init() {}
    
    static let blockSize = kCCBlockSize3DES
}}
