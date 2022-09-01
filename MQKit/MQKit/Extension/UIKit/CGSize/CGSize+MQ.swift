//
//  CGSize+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension CGSize {
    
    var area: CGFloat {
        return self.width * self.height
    }
}

// MARK: - CGSize {+|-|*|/} CGFloat
public extension CGSize {
    
    static func +(a: CGSize, b: CGFloat) -> CGSize {
        return CGSize(width: a.width + b, height: a.height + b)
    }
    
    static func -(a: CGSize, b: CGFloat) -> CGSize {
        return CGSize(width: a.width - b, height: a.height - b)
    }
    
    static func *(a: CGSize, b: CGFloat) -> CGSize {
        return CGSize(width: a.width * b, height: a.height * b)
    }
    
    static func /(a: CGSize, b: CGFloat) -> CGSize {
        return CGSize(width: a.width / b, height: a.height / b)
    }
}

// MARK: - CGSize {+=|-=|*=|/=} CGFloat
public extension CGSize {
    
    static func +=(a: inout CGSize, b: CGFloat) {
        a.width += b
        a.height += b
    }
    
    static func -=(a: inout CGSize, b: CGFloat) {
        a.width -= b
        a.height -= b
    }
    
    static func *=(a: inout CGSize, b: CGFloat) {
        a.width *= b
        a.height *= b
    }
    
    static func /=(a: inout CGSize, b: CGFloat) {
        a.width /= b
        a.height /= b
    }
}
