//
//  CGSize+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension CGSize {
    
    public init(mq_edge: CGFloat) {
        self.init(width: mq_edge, height: mq_edge)
    }
    
    public init(mq_edge: Int) {
        self.init(width: mq_edge, height: mq_edge)
    }
    
    public init(mq_edge: Double) {
        self.init(width: mq_edge, height: mq_edge)
    }
    
    public var mq_area: CGFloat {
        return self.width * self.height
    }
    
    /// !<=0 && !isInf() && !isNaN()
    public func mq_isValidated() -> Bool {
        return !isEmpty() && !isInf() && !isNaN()
    }
    
    func isEmpty() -> Bool {
        return self.width <= 0 || self.height <= 0
    }
    
    func isInf() -> Bool {
        return width == .infinity || height == .infinity || width == -.infinity || height == -.infinity
    }
    
    func isNaN() -> Bool {
        return width == .nan || height == .nan
    }
}
