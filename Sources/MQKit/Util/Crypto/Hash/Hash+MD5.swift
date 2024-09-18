//
//  Hash+MD5.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/8.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import CryptoKit
import CommonCrypto

public extension Crypto {
    
    static func md5(_ data: consuming Data) -> Data {
        return Data(Insecure.MD5.hash(data: data))
    }
}
