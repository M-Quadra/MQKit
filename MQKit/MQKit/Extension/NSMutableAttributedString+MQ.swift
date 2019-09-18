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
    
    public var mq_lineSpacing: CGFloat {
        get {
            return self.mq_paragraphStyle.lineSpacing
        }
        set {
            let parStyle = self.mq_paragraphStyle
            parStyle.lineSpacing = newValue
            
            self.mq_paragraphStyle = parStyle
        }
    }
    
    public var mq_alignment: NSTextAlignment {
        get {
            return self.mq_paragraphStyle.alignment
        }
        set {
            let parStyle = self.mq_paragraphStyle
            parStyle.alignment = newValue
            
            self.mq_paragraphStyle = parStyle
        }
    }
    
    fileprivate var mq_paragraphStyle: NSMutableParagraphStyle {
        get {
            if let parStyle = self.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle {
                return parStyle
            }
            return NSMutableParagraphStyle()
        }
        set {
            let range = NSRange(location: 0, length: self.length)
            self.mq_setAttribute(.paragraphStyle, value: newValue, range: range)
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
