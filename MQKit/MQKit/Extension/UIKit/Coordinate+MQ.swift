//
//  Coordinate+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/24.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension Double {
    public static func mq_radian(angle: Double) -> Double {
        return angle * Double.pi / 180
    }
    public static func mq_radian(angle: Int) -> Double {
        return self.mq_radian(angle: Double(angle))
    }
    public static func mq_radian(angle: CGFloat) -> Double {
        return Double(CGFloat.mq_radian(angle: angle))
    }
    public static func mq_radian(angle: Float) -> Double {
        return self.mq_radian(angle: Double(angle))
    }
}

extension CGFloat {
    public static func mq_radian(angle: Double) -> CGFloat {
        return CGFloat(Double.mq_radian(angle: angle))
    }
    public static func mq_radian(angle: Int) -> CGFloat {
        return self.mq_radian(angle: Double(angle))
    }
    public static func mq_radian(angle: CGFloat) -> CGFloat {
        return angle * CGFloat.pi / 180
    }
    public static func mq_radian(angle: Float) -> CGFloat {
        return CGFloat(angle * Float.pi / 180)
    }
}
