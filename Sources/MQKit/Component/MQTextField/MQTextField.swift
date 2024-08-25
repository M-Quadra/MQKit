//
//  MQTextField.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/31.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public class MQTextField: UITextField {
    required init?(coder: NSCoder) { return nil }
    
    fileprivate lazy var proxy = Proxy(self)
    
    public var maxTextCount = 0
    public var textWithoutMarked: String {
        var text = self.text ?? ""
        guard let range = self.markedTextRange else { return text }
        
        let st = self.offset(from: self.beginningOfDocument, to: range.start)
        let ed = self.offset(from: self.beginningOfDocument, to: range.end)
        
        let stIdx = text.index(text.startIndex, offsetBy: st)
        let edIdx = text.index(text.startIndex, offsetBy: ed)
        text.replaceSubrange(stIdx..<edIdx, with: "")
        return text
    }
    
    public var textDidChang: ((_ textField: MQTextField, _ text: String) -> Void)?
    public func textDidChang(_ handler: @escaping (_ textField: MQTextField, _ text: String) -> Void) {
        self.textDidChang = handler
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self.proxy, action: #selector(Proxy.textFieldDidChange(sender:)), for: .editingChanged)
    }
}

fileprivate extension MQTextField {
    
    @MainActor class Proxy {
        weak var textField: MQTextField?
        
        init(_ textField: MQTextField) {
            self.textField = textField
        }
        
        @objc func textFieldDidChange(sender: MQTextField) {
            guard let textField = self.textField,
                  textField.markedTextRange == nil,
                  let handler = textField.textDidChang
            else { return }
            
            var text = textField.text ?? ""
            if textField.maxTextCount > 0,
               text.count > textField.maxTextCount {
                text = text[0..<textField.maxTextCount].stringValue
                textField.text = text
            }
            
            handler(textField, text)
        }
    }
}
