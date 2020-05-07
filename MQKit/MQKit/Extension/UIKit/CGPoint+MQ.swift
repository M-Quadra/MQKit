//
//  CGPoint+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension CGPoint {
    
    init(mq_xy: CGFloat) {
        self.init(x: mq_xy, y: mq_xy)
    }
    
    init(mq_xy: Int) {
        self.init(x: mq_xy, y: mq_xy)
    }
    
    init(mq_xy: Double) {
        self.init(x: mq_xy, y: mq_xy)
    }
}
