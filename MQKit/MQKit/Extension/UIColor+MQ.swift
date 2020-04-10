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
    public convenience init(hexString: String, alpha: CGFloat = 1) {
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
    
    /// blend color
    convenience init(mq_backgroundColor: UIColor, frontColor: UIColor) {
        // http://stackoverflow.com/questions/10781953/determine-rgba-colour-received-by-combining-two-colours
        
        let bgRed   = mq_backgroundColor.mq_red
        let bgGreen = mq_backgroundColor.mq_green
        let bgBlue  = mq_backgroundColor.mq_blue
        let bgAlpha = mq_backgroundColor.mq_alpha
        
        let frRed   = frontColor.mq_red
        let frGreen = frontColor.mq_green
        let frBlue  = frontColor.mq_blue
        let frAlpha = frontColor.mq_alpha
        
        let alpha = frAlpha + bgAlpha*(1 - frAlpha)
        let red   = (frRed*frAlpha   + bgRed*bgAlpha*(1 - frAlpha))   / alpha
        let green = (frGreen*frAlpha + bgGreen*bgAlpha*(1 - frAlpha)) / alpha
        let blue  = (frBlue*frAlpha  + bgBlue*bgAlpha*(1 - frAlpha))  / alpha
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// random RBG, Alpha = 1
    public class var mq_random: UIColor {
        let r = CGFloat(arc4random() % 255)
        let g = CGFloat(arc4random() % 255)
        let b = CGFloat(arc4random() % 255)
        
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    public func mq_inverseColor() -> UIColor {
        guard let componentAry = self.cgColor.components, componentAry.count == 4 else {
            return .clear
        }
        
        return UIColor(red:   1 - componentAry[0],
                       green: 1 - componentAry[1],
                       blue:  1 - componentAry[2],
                       alpha: componentAry[3])
    }
    
    public var mq_red: CGFloat {
        var red: CGFloat = 0
        guard self.getRed(&red, green: nil, blue: nil, alpha: nil) else {
            return 0
        }
        return red
    }
    
    public var mq_green: CGFloat {
        var green: CGFloat = 0
        guard self.getRed(nil, green: &green, blue: nil, alpha: nil) else {
            return 0
        }
        return green
    }
    
    public var mq_blue: CGFloat {
        var blue: CGFloat = 0
        guard self.getRed(nil, green: nil, blue: &blue, alpha: nil) else {
            return 0
        }
        return blue
    }
    
    public var mq_alpha: CGFloat {
        var alpha: CGFloat = 0
        guard self.getRed(nil, green: nil, blue: nil, alpha: &alpha) else {
            return 0
        }
        return alpha
    }
    
}
