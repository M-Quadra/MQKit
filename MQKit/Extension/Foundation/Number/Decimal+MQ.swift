//
//  Decimal+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2020/5/13.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Foundation

extension Decimal {
    
    public var mq_intValue: Int {
        return Int(truncating: NSDecimalNumber(decimal: self))
    }
}
