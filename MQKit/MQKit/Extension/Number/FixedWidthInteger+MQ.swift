//
//  FixedWidthInteger+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/9/23.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension FixedWidthInteger {
    
    var mq_isOdd: Bool {
        return self&1 == 1
    }
}
