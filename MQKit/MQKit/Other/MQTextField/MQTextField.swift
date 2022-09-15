//
//  MQTextField.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/31.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

@objc public protocol MQTextFieldDelegate : UITextFieldDelegate {
    @objc optional func textField(_ textField: MQTextField, textDidChange text: String)
}

public class MQTextField: UITextField {
    
    @available(*, unavailable)
    public override var delegate: UITextFieldDelegate? {
        didSet {
        }
    }
    fileprivate let delegator = MQTextFieldDelegator()
    
    public var delegate_: MQTextFieldDelegate?
    
    public var maxTextCount = Int.max {
        didSet {
            if self.maxTextCount < 0 {
                self.maxTextCount = 0
            }
            
            if self.markedTextRange != nil || self.text?.count ?? 0 <= self.maxTextCount {
                return
            }
            
            self.delegator.textFieldDidChange(textField: self)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.didInitialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.didInitialize()
    }
    
    func didInitialize() {
        self.delegator.textField = self
        super.delegate = self.delegator
        
        self.addTarget(self.delegator, action: #selector(MQTextFieldDelegator.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
}

fileprivate class MQTextFieldDelegator: NSObject, UITextFieldDelegate {
    
    weak var textField: MQTextField?
    
    @objc func textFieldDidChange(textField: MQTextField) {
        guard textField == self.textField, let field = self.textField else {
            return
        }
        let text = field.text ?? ""
        
        if field.markedTextRange != nil || text.count < field.maxTextCount {
            field.delegate_?.textField?(field, textDidChange: text)
            return
        }
        
        field.text = text[0..<field.maxTextCount].stringValue
        field.delegate_?.textField?(field, textDidChange: field.text ?? "")
    }
}
