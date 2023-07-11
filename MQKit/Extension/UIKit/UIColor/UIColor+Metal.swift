//
//  UIColor+Metal.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/25.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIColor {
    
    var mtlClearColor: MTLClearColor {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return MTLClearColorMake(Double(r), Double(g), Double(b), Double(a))
    }
}
