//
//  UIControl+DSL.swift
//
//
//  Created by m_quadra on 2024/5/11.
//

import UIKit

public extension UIViewDSL where T: UIControl {
    
    @discardableResult
    consuming func isEnabled(_ isEnabled: consuming Bool) -> Self {
        object.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    consuming func isSelected(_ isSelected: consuming Bool) -> Self {
        object.isSelected = isSelected
        return self
    }
    
    @discardableResult
    consuming func isHighlighted(_ isHighlighted: consuming Bool) -> Self {
        object.isHighlighted = isHighlighted
        return self
    }
}
