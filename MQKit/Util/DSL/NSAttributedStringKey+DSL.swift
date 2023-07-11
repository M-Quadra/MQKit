//
//  NSAttributedStringKey+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/12/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension DictionaryDSL where Key == NSAttributedString.Key, Value == Any {
    
    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.dic[.font] = font
        return self
    }

    @discardableResult
    func paragraphStyle(_ paragraphStyle: NSParagraphStyle?) -> Self {
        self.dic[.paragraphStyle] = paragraphStyle
        return self
    }

    @discardableResult
    func foregroundColor(_ foregroundColor: UIColor?) -> Self {
        self.dic[.foregroundColor] = foregroundColor
        return self
    }

    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.dic[.backgroundColor] = backgroundColor
        return self
    }

    @discardableResult
    func ligature(_ ligature: Int) -> Self {
        self.dic[.ligature] = ligature
        return self
    }

    @discardableResult
    func kern(_ kern: CGFloat) -> Self {
        self.dic[.kern] = kern
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func tracking(_ tracking: CGFloat) -> Self {
        self.dic[.tracking] = tracking
        return self
    }

    @discardableResult
    func strikethroughStyle(_ strikethroughStyle: NSUnderlineStyle) -> Self {
        self.dic[.strikethroughStyle] = strikethroughStyle
        return self
    }

    @discardableResult
    func underlineStyle(_ underlineStyle: NSUnderlineStyle) -> Self {
        self.dic[.underlineStyle] = underlineStyle
        return self
    }

    @discardableResult
    func strokeColor(_ strokeColor: UIColor?) -> Self {
        self.dic[.strokeColor] = strokeColor
        return self
    }

    @discardableResult
    func strokeWidth(_ strokeWidth: CGFloat) -> Self {
        self.dic[.strokeWidth] = strokeWidth
        return self
    }

    @discardableResult
    func shadow(_ shadow: NSShadow?) -> Self {
        self.dic[.shadow] = shadow
        return self
    }

    @discardableResult
    func textEffect(_ textEffect: NSAttributedString.TextEffectStyle) -> Self {
        self.dic[.textEffect] = textEffect
        return self
    }

    @discardableResult
    func attachment(_ attachment: NSTextAttachment?) -> Self {
        self.dic[.attachment] = attachment
        return self
    }

    @discardableResult
    func link(_ link: URL?) -> Self {
        self.dic[.link] = link
        return self
    }

    @discardableResult
    func baselineOffset(_ baselineOffset: CGFloat) -> Self {
        self.dic[.baselineOffset] = baselineOffset
        return self
    }

    @discardableResult
    func underlineColor(_ underlineColor: UIColor?) -> Self {
        self.dic[.underlineColor] = underlineColor
        return self
    }

    @discardableResult
    func strikethroughColor(_ strikethroughColor: UIColor?) -> Self {
        self.dic[.strikethroughColor] = strikethroughColor
        return self
    }

    @discardableResult
    func obliqueness(_ obliqueness: CGFloat) -> Self {
        self.dic[.obliqueness] = obliqueness
        return self
    }

    @discardableResult
    func expansion(_ expansion: CGFloat) -> Self {
        self.dic[.expansion] = expansion
        return self
    }

    @discardableResult
    func writingDirection(_ writingDirection: [Int]) -> Self {
        self.dic[.writingDirection] = writingDirection
        return self
    }

    @discardableResult
    func verticalGlyphForm(_ verticalGlyphForm: Int) -> Self {
        self.dic[.verticalGlyphForm] = verticalGlyphForm
        return self
    }
}
