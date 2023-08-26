//
//  UITextField+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/13.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension UITextField {
    
    var markedText: String {
        guard let markedRange = self.markedTextRange else { return "" }
        
        return self.text(in: markedRange) ?? ""
    }
    
    var selectedText: String {
        guard let selectedRange = self.selectedTextRange else { return "" }
        
        return self.text(in: selectedRange) ?? ""
    }
}
