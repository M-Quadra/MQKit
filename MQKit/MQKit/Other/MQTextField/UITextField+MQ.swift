//
//  UITextField+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/13.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

fileprivate extension String {
    
    func mq_lengthOfNSString() -> Int {
        return self.lengthOfBytes(using: .unicode)/2
    }
}

extension UITextField {
    
    var mq_markedText: String {
        guard let markedRange = self.markedTextRange else {
            return ""
        }
        
        return self.text(in: markedRange) ?? ""
    }
    
    var mq_selectedText: String {
        guard let selectedRange = self.selectedTextRange else {
            return ""
        }
        
        return self.text(in: selectedRange) ?? ""
    }
}
