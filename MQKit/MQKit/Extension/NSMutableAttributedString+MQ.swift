//
//  NSMutableAttributedString+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/31.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    public var mq_color: UIColor? {
        get {
            guard let color = self.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else {
                return nil
            }
            return color
        }
        set {
            let range = NSRange(location: 0, length: self.length)
            self.mq_setAttribute(.foregroundColor, value: newValue, range: range)
        }
    }
    
    public var mq_font: UIFont? {
        get {
            guard let font = self.attribute(.font, at: 0, effectiveRange: nil) as? UIFont else {
                return nil
            }
            return font
        }
        set {
            let range = NSRange(location: 0, length: self.length)
            self.mq_setAttribute(.font, value: newValue, range: range)
        }
    }
    
    fileprivate func mq_setAttribute(_ name: NSAttributedString.Key, value: Any?, range: NSRange) {
        guard let nowValue = value else {
            self.removeAttribute(name, range: range)
            return
        }
        
        self.addAttribute(name, value: nowValue, range: range)
    }
}
