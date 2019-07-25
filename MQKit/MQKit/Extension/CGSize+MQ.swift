//
//  CGSize+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension CGSize {
    
    init(mq_edge: CGFloat) {
        self.init(width: mq_edge, height: mq_edge)
    }
    
    init(mq_edge: Int) {
        self.init(width: mq_edge, height: mq_edge)
    }
    
    init(mq_edge: Double) {
        self.init(width: mq_edge, height: mq_edge)
    }
}
