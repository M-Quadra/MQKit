//
//  UInt8+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/12/30.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension UInt8 {
    
    static var random: UInt8 {
        return UInt8.random(in: 0..<UInt8.max)
    }
}
