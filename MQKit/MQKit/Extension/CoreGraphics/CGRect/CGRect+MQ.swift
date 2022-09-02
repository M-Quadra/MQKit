//
//  CGRect+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2020/5/7.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import CoreGraphics

// MARK: - CGRect {+|-} CGPoint
public extension CGRect {
    
    static func +(a: CGRect, b: CGPoint) -> CGRect {
        return CGRect(origin: a.origin + b, size: a.size)
    }

    static func -(a: CGRect, b: CGPoint) -> CGRect {
        return CGRect(origin: a.origin - b, size: a.size)
    }
}

// MARK: - CGRect {+=|-=} CGPoint
public extension CGRect {

    static func +=(a: inout CGRect, b: CGPoint) {
        a.origin += b
    }

    static func -=(a: inout CGRect, b: CGPoint) {
        a.origin -= b
    }
}
