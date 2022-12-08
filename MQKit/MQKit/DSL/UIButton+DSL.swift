//
//  UIButton+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension CALayerDSL where T: UIButton {
    
    @discardableResult
    func setTitle(_ title: String?, for state: UIControl.State) -> Self {
        self.object?.setTitle(title, for: state)
        return self
    }

    @discardableResult
    func setTitleColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        self.object?.setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    func setImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.object?.setImage(image, for: state)
        return self
    }

    @discardableResult
    func setBackgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.object?.setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) -> Self {
        self.object?.setAttributedTitle(title, for: state)
        return self
    }

    @discardableResult
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        self.object?.addTarget(target, action: action, for: controlEvents)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func addAction(handler: @escaping ((_ act: UIAction) -> Void), for event: UIControl.Event) -> Self {
        self.object?.addAction(UIAction(handler: handler), for: event)
        return self
    }
}
