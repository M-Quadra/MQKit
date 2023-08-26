//
//  UIColor+Creator.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/25.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// alpha=1
    static var random: UIColor {
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    /// #RRGGBB
    static func hex(_ hex: String, alpha: CGFloat = 1) -> UIColor {
        let str = String(hex.dropFirst())
        let a = min(max(0, alpha), 1)
        
        var num: UInt64 = 0
        if !Scanner(string: str).scanHexInt64(&num) {
#if DEBUG
            fatalError("UIColor.hex failed")
#else
            return .clear
#endif
        }
        
        let b = CGFloat(num & 0xFF)/255
        num >>= 8
        let g = CGFloat(num & 0xFF)/255
        num >>= 8
        let r = CGFloat(num & 0xFF)/255
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
