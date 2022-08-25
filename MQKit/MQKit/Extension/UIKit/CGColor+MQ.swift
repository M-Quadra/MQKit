//
//  CGColor+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/25.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension CGColor {
    
    /// alpha=1
    static var random: CGColor {
        return UIColor.random.cgColor
    }
    
    /// #RRGGBB
    static func hex(_ hex: String, alpha: CGFloat = 1) -> CGColor {
        return UIColor.hex(hex, alpha: alpha).cgColor
    }
    
    class var black: CGColor {
        return UIColor.black.cgColor
    }

    class var darkGray: CGColor {
        return UIColor.darkGray.cgColor
    }

    class var lightGray: CGColor {
        return UIColor.lightGray.cgColor
    }

    class var white: CGColor {
        return UIColor.white.cgColor
    }

    class var gray: CGColor {
        return UIColor.gray.cgColor
    }

    class var red: CGColor {
        return UIColor.red.cgColor
    }

    class var green: CGColor {
        return UIColor.green.cgColor
    }

    class var blue: CGColor {
        return UIColor.blue.cgColor
    }

    class var cyan: CGColor {
        return UIColor.cyan.cgColor
    }

    class var yellow: CGColor {
        return UIColor.yellow.cgColor
    }

    class var magenta: CGColor {
        return UIColor.magenta.cgColor
    }

    class var orange: CGColor {
        return UIColor.orange.cgColor
    }

    class var purple: CGColor {
        return UIColor.purple.cgColor
    }

    class var brown: CGColor {
        return UIColor.brown.cgColor
    }

    class var clear: CGColor {
        return UIColor.clear.cgColor
    }
}
