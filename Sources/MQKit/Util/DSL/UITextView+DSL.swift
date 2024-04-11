//
//  UITextView+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2023/8/8.
//

import UIKit

public extension UIViewDSL where T: UITextView {
    
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        self.object.delegate = delegate
        return self
    }

    @discardableResult
    func text(_ text: String?) -> Self {
        self.object.text = text
        return self
    }

    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.object.font = font
        return self
    }

    @discardableResult
    func textColor(_ textColor: UIColor?) -> Self {
        self.object.textColor = textColor
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.object.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func selectedRange(_ selectedRange: NSRange) -> Self {
        self.object.selectedRange = selectedRange
        return self
    }

    @discardableResult
    func isEditable(_ isEditable: Bool) -> Self {
        self.object.isEditable = isEditable
        return self
    }

    @discardableResult
    func isSelectable(_ isSelectable: Bool) -> Self {
        self.object.isSelectable = isSelectable
        return self
    }

    @discardableResult
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Self {
        self.object.dataDetectorTypes = dataDetectorTypes
        return self
    }

    @discardableResult
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.object.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }

    @discardableResult
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.object.attributedText = attributedText
        return self
    }

    @discardableResult
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.object.typingAttributes = typingAttributes
        return self
    }

    @discardableResult
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.object.clearsOnInsertion = clearsOnInsertion
        return self
    }

    @discardableResult
    func textContainerInset(_ textContainerInset: UIEdgeInsets) -> Self {
        self.object.textContainerInset = textContainerInset
        return self
    }

    @discardableResult
    func linkTextAttributes(_ linkTextAttributes: [NSAttributedString.Key : Any]?) -> Self {
        self.object.linkTextAttributes = linkTextAttributes
        return self
    }
}
