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
    convenience init(hex: String, alpha: CGFloat = 1) {
        let str = String(hex.dropFirst())
        let a = min(max(0, alpha), 1)
        
        var num: UInt64 = 0
        Scanner(string: str).scanHexInt64(&num)
        
        let b = CGFloat(num & 0xFF)/255
        num >>= 8
        let g = CGFloat(num & 0xFF)/255
        num >>= 8
        let r = CGFloat(num & 0xFF)/255
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /// #RRGGBB
    static func hex(_ hex: String, alpha: CGFloat = 1) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)
    }
}
