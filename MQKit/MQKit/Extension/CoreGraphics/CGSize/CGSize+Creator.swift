//
//  CGSize+Creator.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/26.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    
    static var max: CGSize {
        return CGSize(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        )
    }
    
    init(_ edge: CGFloat) {
        self.init(width: edge, height: edge)
    }
    
    init(_ edge: Int) {
        self.init(width: edge, height: edge)
    }
    
    init(_ edge: Double) {
        self.init(width: edge, height: edge)
    }
}
