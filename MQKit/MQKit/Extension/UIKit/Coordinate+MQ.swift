//
//  Coordinate+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/24.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension Double {
    
    static func radian(angle: Double) -> Double {
        return angle * Double.pi / 180
    }
    
    static func radian(angle: Int) -> Double {
        return self.radian(angle: Double(angle))
    }
    
    static func radian(angle: CGFloat) -> Double {
        return angle * CGFloat.pi / 180.0
    }
    
    static func radian(angle: Float) -> Double {
        return Double(angle * Float.pi / 180.0)
    }
}

public extension CGFloat {
    
    static func radian(angle: Double) -> CGFloat {
        return angle * Double.pi / 180
    }
    
    static func radian(angle: Int) -> CGFloat {
        return self.radian(angle: Double(angle))
    }
    
    static func radian(angle: CGFloat) -> CGFloat {
        return angle * CGFloat.pi / 180
    }
    
    static func radian(angle: Float) -> CGFloat {
        return CGFloat(angle * Float.pi / 180)
    }
}
