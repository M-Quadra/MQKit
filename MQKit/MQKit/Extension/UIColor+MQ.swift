//
//  UIColor+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/5.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIColor {
    /// #RRGGBB
    convenience init(hexString: String, alpha: CGFloat = 1) {
        if hexString.lengthOfBytes(using: .ascii) != "#RRGGBB".lengthOfBytes(using: .ascii) {
            self.init(cgColor: UIColor.clear.cgColor)
            return
        }
        
        let colorStr = hexString.replacingOccurrences(of: "#", with: "")
        let colorAlpha = max(0, min(alpha, 1))
        
        var colorNum = UInt32(0);
        Scanner(string: colorStr).scanHexInt32(&colorNum)
        
        let blue = CGFloat(colorNum & 0xFF)/255
        colorNum >>= 8
        let green = CGFloat(colorNum & 0xFF)/255
        colorNum >>= 8
        let red = CGFloat(colorNum & 0xFF)/255
        
        self.init(red: red, green: green, blue: blue, alpha: colorAlpha)
    }
    
    /// random RBG, Alpha = 1
    public class var mq_random: UIColor {
        let r = CGFloat(arc4random() % 255)
        let g = CGFloat(arc4random() % 255)
        let b = CGFloat(arc4random() % 255)
        
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
