//
//  String+MQValue.swift
//  MQKit
//
//  Created by M_Quadra on 2019/10/10.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String {
    
    /// return 0 when fail
    public var mq_intValue: Int {
        return Int(self) ?? 0
    }
    
    /// return 0.0 when fail
    public var mq_doubleValue: Double {
        return Double(self) ?? 0.0
    }
    
    /// return 0.0 when fail
    public var mq_floatValue: Float {
        return Float(self) ?? 0.0
    }
}
