//
//  Pow+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2020/5/13.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Foundation
import UIKit

precedencegroup MQExponentiatePrecedence {
    associativity: none
    higherThan: BitwiseShiftPrecedence
    assignment: false
}

infix operator **: MQExponentiatePrecedence
public func **(left: Decimal, right: Int) -> Decimal {
    return pow(left, right)
}

public func **(left: Float, right: Float) -> Float {
    return pow(left, right)
}

#if arch(i386) || arch(x86_64)
public func **(left: Float80, right: Float80) -> Float80 {
    return pow(left, right)
}
#endif

public func **(left: Double, right: Double) -> Double {
    return pow(left, right)
}

public func **(left: CGFloat, right: CGFloat) -> CGFloat {
    return pow(left, right)
}

public func **(left: Int, right: Int) -> Decimal {
    return pow(Decimal(left), right)
}
