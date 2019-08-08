//
//  Data+MQCrypt.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/8.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension Data {
    
    public static func mq_random(bytes: Int) -> Data {
        let byteAry = Data(count: bytes).map({ _ in
            UInt8(arc4random() % (UInt32(UInt8.max)+1))
        })
        return Data(byteAry)
    }
    
    public static var mq_random128: Data {
        return .mq_random(bytes: 128/8)
    }
    
    public static var mq_random192: Data {
        return .mq_random(bytes: 192/8)
    }
    
    public static var mq_random256: Data {
        return .mq_random(bytes: 256/8)
    }
    
    public static var mq_random1024: Data {
        return .mq_random(bytes: 1024/8)
    }
}
