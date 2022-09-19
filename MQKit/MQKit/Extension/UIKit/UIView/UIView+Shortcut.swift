//
//  UIView+Shortcut.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/19.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIView {
    
    var top: CGFloat {
        get {
            return self.frame.minY
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.minX
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.frame.maxY
        }
        set {
            self.frame.origin.y = newValue - self.frame.height
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            self.frame.origin.x = newValue - self.frame.width
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            self.frame.size = CGSize(width: newValue, height: self.frame.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.height
        }
        set {
            self.frame.size = CGSize(width: self.frame.width, height: newValue)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center.y = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
}
