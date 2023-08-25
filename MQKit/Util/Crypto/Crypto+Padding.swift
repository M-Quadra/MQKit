//
//  Crypto+Padding.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension Crypto { enum Padding {
    case zero, pkcs7
}}

public extension Crypto.Padding {
    
    func padding(data: Data, blockSize: Int) -> Data {
        let padding = blockSize - (data.count%blockSize)
        let cnt = data.count + padding
        
        let optPtr = UnsafeMutablePointer<UInt8>.allocate(capacity: cnt)
        defer { free(optPtr) }
        data.copyBytes(to: optPtr, count: data.count)
        
        let size = MemoryLayout<UInt8>.size
        switch self {
        case .zero:
            memset(optPtr + data.count, 0, padding * size)
        case .pkcs7:
            memset(optPtr + data.count, Int32(padding), padding * size)
        }
        
        return Data(bytes: optPtr, count: cnt)
    }
}
