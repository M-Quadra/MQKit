//
//  RangeExpression+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/12/5.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

infix operator !~=: ComparisonPrecedence

public extension RangeExpression {
    
    static func !~=(a: Self, b: Bound) -> Bool {
        return !(a ~= b)
    }
}
