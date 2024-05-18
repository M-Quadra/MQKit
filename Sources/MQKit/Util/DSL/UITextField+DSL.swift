//
//  UITextField+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2023/7/21.
//

import UIKit

public extension UIViewDSL where T: UITextField {
    
    @discardableResult
    consuming func text(_ text: String?) -> Self {
        self.object.text = text
        return self
    }
    
    @discardableResult
    consuming func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.object.attributedText = attributedText
        return self
    }
    
    @discardableResult
    consuming func textColor(_ textColor: UIColor?) -> Self {
        self.object.textColor = textColor
        return self
    }
    
    @discardableResult
    consuming func font(_ font: UIFont?) -> Self {
        self.object.font = font
        return self
    }
    
    @discardableResult
    consuming func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.object.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    consuming func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
        self.object.borderStyle = borderStyle
        return self
    }
    
    @discardableResult
    consuming func defaultTextAttributes(_ defaultTextAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.object.defaultTextAttributes = defaultTextAttributes
        return self
    }
    
    @discardableResult
    consuming func placeholder(_ placeholder: String?) -> Self {
        self.object.placeholder = placeholder
        return self
    }
    
    @discardableResult
    consuming func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.object.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    @discardableResult
    consuming func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self {
        self.object.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    
    @discardableResult
    consuming func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.object.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    @discardableResult
    consuming func minimumFontSize(_ minimumFontSize: CGFloat) -> Self {
        self.object.minimumFontSize = minimumFontSize
        return self
    }
    
    @discardableResult
    consuming func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.object.delegate = delegate
        return self
    }
    
    @discardableResult
    consuming func background(_ background: UIImage?) -> Self {
        self.object.background = background
        return self
    }
    
    @discardableResult
    consuming func disabledBackground(_ disabledBackground: UIImage?) -> Self {
        self.object.disabledBackground = disabledBackground
        return self
    }
    
    @discardableResult
    consuming func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.object.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    @discardableResult
    consuming func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]?) -> Self {
        self.object.typingAttributes = typingAttributes
        return self
    }
    
    @discardableResult
    consuming func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> Self {
        self.object.clearButtonMode = clearButtonMode
        return self
    }
    
    @discardableResult
    consuming func leftView(_ leftView: UIView?) -> Self {
        self.object.leftView = leftView
        return self
    }
    
    @discardableResult
    consuming func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Self {
        self.object.leftViewMode = leftViewMode
        return self
    }
    
    @discardableResult
    consuming func rightView(_ rightView: UIView?) -> Self {
        self.object.rightView = rightView
        return self
    }
    
    @discardableResult
    consuming func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Self {
        self.object.rightViewMode = rightViewMode
        return self
    }
    
    @discardableResult
    consuming func inputView(_ inputView: UIView?) -> Self {
        self.object.inputView = inputView
        return self
    }
    
    @discardableResult
    consuming func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.object.inputAccessoryView = inputAccessoryView
        return self
    }
    
    @discardableResult
    consuming func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.object.clearsOnInsertion = clearsOnInsertion
        return self
    }
    
    @discardableResult
    consuming func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .editingChanged) -> Self {
        self.object.addTarget(target, action: action, for: controlEvents)
        return self
    }
    
    @discardableResult
    consuming func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self {
        self.object.returnKeyType = returnKeyType
        return self
    }
}
