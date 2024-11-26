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
        guard var num = UInt64(hex.dropFirst(), radix: 16) else {
            assertionFailure("Invalid hex string")
            return .clear
        }
        
        let b = CGFloat(num & 0xFF)/255
        num >>= 8
        let g = CGFloat(num & 0xFF)/255
        num >>= 8
        let r = CGFloat(num & 0xFF)/255
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    @available(iOS 13.0, *)
    static func dynamic(any: UIColor, dark: UIColor) -> UIColor {
        return UIColor { $0.userInterfaceStyle == .dark ? dark : any }
    }
}
