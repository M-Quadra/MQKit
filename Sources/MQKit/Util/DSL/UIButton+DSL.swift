//
//  UIButton+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIViewDSL where T: UIButton {
    
    @discardableResult
    consuming func setTitle(_ title: consuming String?, for state: consuming UIControl.State = .normal) -> Self {
        self.object.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    consuming func setTitleColor(_ color: consuming UIColor?, for state: consuming UIControl.State = .normal) -> Self {
        self.object.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    consuming func setImage(_ image: consuming UIImage?, for state: consuming UIControl.State = .normal) -> Self {
        self.object.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    consuming func setBackgroundImage(_ image: consuming UIImage?, for state: consuming UIControl.State = .normal) -> Self {
        self.object.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    consuming func setAttributedTitle(_ title: consuming NSAttributedString?, for state: consuming UIControl.State = .normal) -> Self {
        self.object.setAttributedTitle(title, for: state)
        return self
    }
    
    @discardableResult
    consuming func addTarget(_ target: consuming Any?, action: consuming Selector, for controlEvents: consuming UIControl.Event = .touchUpInside) -> Self {
        self.object.addTarget(target, action: action, for: controlEvents)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    consuming func addAction(handler: consuming @escaping ((_ act: UIAction) -> Void), for event: consuming UIControl.Event = .touchUpInside) -> Self {
        self.object.addAction(UIAction(handler: handler), for: event)
        return self
    }
}
