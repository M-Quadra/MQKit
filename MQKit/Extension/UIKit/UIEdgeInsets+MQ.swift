//
//  UIEdgeInsets+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    static func top(_ top: CGFloat) -> Self {
        return .init(top: top, left: 0, bottom: 0, right: 0)
    }

    static func left(_ left: CGFloat) -> Self {
        return .init(top: 0, left: left, bottom: 0, right: 0)
    }

    static func bottom(_ bottom: CGFloat) -> Self {
        return .init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    static func right(_ right: CGFloat) -> Self {
        return .init(top: 0, left: 0, bottom: 0, right: right)
    }

    static func horizontal(_ horizontal: CGFloat) -> Self {
        return .init(top: 0, left: horizontal, bottom: 0, right: horizontal)
    }

    static func vertical(_ vertical: CGFloat) -> Self {
        return .init(top: vertical, left: 0, bottom: vertical, right: 0)
    }

    static func all(_ all: CGFloat) -> Self {
        return .init(top: all, left: all, bottom: all, right: all)
    }
}
