//
//  Double+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/10.
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
        return self.mq_radian(angle: Double(angle))
    }
    public static func mq_radian(angle: Float) -> Double {
        return self.mq_radian(angle: Double(angle))
    }
}
