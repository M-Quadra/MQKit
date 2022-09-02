//
//  CGPoint+Creator.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/26.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension CGPoint {
    
    init(_ xy: CGFloat) {
        self.init(x: xy, y: xy)
    }
    
    init(_ xy: Int) {
        self.init(x: xy, y: xy)
    }
    
    init(_ xy: Double) {
        self.init(x: xy, y: xy)
    }
}
