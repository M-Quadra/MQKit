//
//  UITextField+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2023/7/21.
//

import UIKit

public extension UIViewDSL where T: UITextField {
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.object.text = text
        return self
    }

    @discardableResult
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.object.attributedText = attributedText
        return self
    }

    @discardableResult
    func textColor(_ textColor: UIColor?) -> Self {
        self.object.textColor = textColor
        return self
    }

    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.object.font = font
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.object.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
        self.object.borderStyle = borderStyle
        return self
    }

    @discardableResult
    func defaultTextAttributes(_ defaultTextAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.object.defaultTextAttributes = defaultTextAttributes
        return self
    }

    @discardableResult
    func placeholder(_ placeholder: String?) -> Self {
        self.object.placeholder = placeholder
        return self
    }

    @discardableResult
    func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.object.attributedPlaceholder = attributedPlaceholder
        return self
    }

    @discardableResult
    func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self {
        self.object.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }

    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.object.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }

    @discardableResult
    func minimumFontSize(_ minimumFontSize: CGFloat) -> Self {
        self.object.minimumFontSize = minimumFontSize
        return self
    }

    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.object.delegate = delegate
        return self
    }

    @discardableResult
    func background(_ background: UIImage?) -> Self {
        self.object.background = background
        return self
    }

    @discardableResult
    func disabledBackground(_ disabledBackground: UIImage?) -> Self {
        self.object.disabledBackground = disabledBackground
        return self
    }

    @discardableResult
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.object.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }

    @discardableResult
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]?) -> Self {
        self.object.typingAttributes = typingAttributes
        return self
    }

    @discardableResult
    func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> Self {
        self.object.clearButtonMode = clearButtonMode
        return self
    }

    @discardableResult
    func leftView(_ leftView: UIView?) -> Self {
        self.object.leftView = leftView
        return self
    }

    @discardableResult
    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Self {
        self.object.leftViewMode = leftViewMode
        return self
    }

    @discardableResult
    func rightView(_ rightView: UIView?) -> Self {
        self.object.rightView = rightView
        return self
    }

    @discardableResult
    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Self {
        self.object.rightViewMode = rightViewMode
        return self
    }

    @discardableResult
    func inputView(_ inputView: UIView?) -> Self {
        self.object.inputView = inputView
        return self
    }

    @discardableResult
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.object.inputAccessoryView = inputAccessoryView
        return self
    }

    @discardableResult
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.object.clearsOnInsertion = clearsOnInsertion
        return self
    }
}
