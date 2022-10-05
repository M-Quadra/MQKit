//
//  UILabel+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/22.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension ObjectDSL where T: UILabel {
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.object?.text = text
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.object?.font = font
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.object?.textColor = color
        return self
    }

    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.object?.textAlignment = alignment
        return self
    }

    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        self.object?.lineBreakMode = mode
        return self
    }

    @discardableResult
    func attributedText(_ text: NSAttributedString?) -> Self {
        self.object?.attributedText = text
        return self
    }

    @discardableResult
    func numberOfLines(_ number: Int) -> Self {
        self.object?.numberOfLines = number
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjusts: Bool) -> Self {
        self.object?.adjustsFontSizeToFitWidth = adjusts
        return self
    }
}
