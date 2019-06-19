//
//  UIView+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/10.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIView {
    
    public var mq_top: CGFloat {
        get {
            return self.frame.minY
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var mq_left: CGFloat {
        get {
            return self.frame.minX
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var mq_bottom: CGFloat {
        get {
            return self.frame.maxY
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - frame.height
            self.frame = frame
        }
    }
    
    public var mq_right: CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - frame.width
            self.frame = frame
        }
    }
    
    public var mq_parentViewController: UIViewController? {
        var responder = self.next
        while responder != nil {
            if let vc = responder as? UIViewController {
                return vc
            }
            responder = responder?.next
        }
        return nil
    }
}
