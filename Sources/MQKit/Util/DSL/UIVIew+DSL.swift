//
//  UIVIew+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIViewDSL {
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.object?.clipsToBounds = clipsToBounds
        return self
    }

    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.object?.backgroundColor = backgroundColor
        return self
    }

    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.object?.alpha = alpha
        return self
    }

    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.object?.isHidden = isHidden
        return self
    }

    @discardableResult
    func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.object?.contentMode = contentMode
        return self
    }

    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.object?.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }

    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.object?.tag = tag
        return self
    }
}
