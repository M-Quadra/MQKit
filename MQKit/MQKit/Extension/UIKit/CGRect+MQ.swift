//
//  CGRect+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2020/5/7.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import UIKit

extension CGRect {
    
    /// origin: .zero, size: mq_size
    public init(mq_size: CGSize) {
        self.init(origin: .zero, size: mq_size)
    }
}
