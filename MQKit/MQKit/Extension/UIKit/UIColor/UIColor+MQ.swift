//
//  UIColor+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/5.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// blend color
    convenience init(mq_backgroundColor: UIColor, frontColor: UIColor) {
        // http://stackoverflow.com/questions/10781953/determine-rgba-colour-received-by-combining-two-colours
        
        let bgRed   = mq_backgroundColor.getRed
        let bgGreen = mq_backgroundColor.getGreen
        let bgBlue  = mq_backgroundColor.getBlue
        let bgAlpha = mq_backgroundColor.getAlpha
        guard bgAlpha > 0 else {
            self.init(cgColor: frontColor.cgColor)
            return
        }
        
        let frRed   = frontColor.getRed
        let frGreen = frontColor.getGreen
        let frBlue  = frontColor.getBlue
        let frAlpha = frontColor.getAlpha
        guard frAlpha > 0 else {
            self.init(cgColor: mq_backgroundColor.cgColor)
            return
        }
        
        let alpha = frAlpha + bgAlpha*(1 - frAlpha)
        let red   = (frRed*frAlpha   + bgRed*bgAlpha*(1 - frAlpha))   / alpha
        let green = (frGreen*frAlpha + bgGreen*bgAlpha*(1 - frAlpha)) / alpha
        let blue  = (frBlue*frAlpha  + bgBlue*bgAlpha*(1 - frAlpha))  / alpha
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var inverse: UIColor? {
        guard let arr = self.cgColor.components, arr.count >= 4 else { return nil }
        
        return UIColor(
            red:   1 - arr[0],
            green: 1 - arr[1],
            blue:  1 - arr[2],
            alpha: arr[3]
        )
    }
    
    var getRed: CGFloat {
        var r: CGFloat = 0
        self.getRed(&r, green: nil, blue: nil, alpha: nil)
        return r
    }
    
    var getGreen: CGFloat {
        var g: CGFloat = 0
        self.getRed(nil, green: &g, blue: nil, alpha: nil)
        return g
    }
    
    var getBlue: CGFloat {
        var b: CGFloat = 0
        self.getRed(nil, green: nil, blue: &b, alpha: nil)
        return b
    }
    
    var getAlpha: CGFloat {
        var a: CGFloat = 0
        self.getRed(nil, green: nil, blue: nil, alpha: &a)
        return a
    }
}
