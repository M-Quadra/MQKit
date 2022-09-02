//
//  CGPoint+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import CoreGraphics

// MARK: - CGPoint {+|-} CGPoint
public extension CGPoint {

    static func +(a: CGPoint, b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x + b.x, y: a.y + b.y)
    }

    static func -(a: CGPoint, b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x - b.x, y: a.y - b.y)
    }
}

// MARK: - CGPoint {+=|-=} CGPoint
public extension CGPoint {
    
    static func +=(a: inout CGPoint, b: CGPoint) {
        a.x += b.x
        a.y += b.y
    }
    
    static func -=(a: inout CGPoint, b: CGPoint) {
        a.x -= b.x
        a.y -= b.y
    }
}

// MARK: - CGPoint {+|-|*|/} CGFloat
public extension CGPoint {
    
    static func +(a: CGPoint, b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x + b, y: a.y + b)
    }
    
    static func -(a: CGPoint, b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x - b, y: a.y - b)
    }
    
    static func *(a: CGPoint, b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x * b, y: a.y * b)
    }
    
    static func /(a: CGPoint, b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x / b, y: a.y / b)
    }
}

// MARK: - CGPoint {+=|-=|*=|/=} CGFloat
public extension CGPoint {
    
    static func +=(a: inout CGPoint, b: CGFloat) {
        a.x += b
        a.y += b
    }
    
    static func -=(a: inout CGPoint, b: CGFloat) {
        a.x -= b
        a.y -= b
    }
    
    static func *=(a: inout CGPoint, b: CGFloat) {
        a.x *= b
        a.y *= b
    }
    
    static func /=(a: inout CGPoint, b: CGFloat) {
        a.x /= b
        a.y /= b
    }
}
