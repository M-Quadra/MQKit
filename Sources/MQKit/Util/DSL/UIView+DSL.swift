//
//  UIView+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@MainActor public struct UIViewDSL<T: UIView> {
    public let object: T
    init(_ object: T) {
        self.object = object
    }
}

@MainActor @discardableResult
public func dsl<T: UIView>(
    for view: T = T(),
    closure: (_ make: UIViewDSL<T>) -> Void
) -> T {
    closure(UIViewDSL(view))
    return view
}

public extension UIViewDSL {
    
    @discardableResult
    consuming func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.object.clipsToBounds = clipsToBounds
        return self
    }

    @discardableResult
    consuming func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.object.backgroundColor = backgroundColor
        return self
    }

    @discardableResult
    consuming func alpha(_ alpha: CGFloat) -> Self {
        self.object.alpha = alpha
        return self
    }

    @discardableResult
    consuming func isHidden(_ isHidden: Bool) -> Self {
        self.object.isHidden = isHidden
        return self
    }

    @discardableResult
    consuming func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.object.contentMode = contentMode
        return self
    }

    @discardableResult
    consuming func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.object.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }

    @discardableResult
    consuming func tag(_ tag: Int) -> Self {
        self.object.tag = tag
        return self
    }
}
