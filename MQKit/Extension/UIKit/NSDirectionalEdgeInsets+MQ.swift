//
//  NSDirectionalEdgeInsets+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/22.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension NSDirectionalEdgeInsets {

    static func top(_ top: CGFloat) -> Self {
        return .init(top: top, leading: 0, bottom: 0, trailing: 0)
    }

    static func leading(_ leading: CGFloat) -> Self {
        return .init(top: 0, leading: leading, bottom: 0, trailing: 0)
    }

    static func bottom(_ bottom: CGFloat) -> Self {
        return .init(top: 0, leading: 0, bottom: bottom, trailing: 0)
    }

    static func trailing(_ trailing: CGFloat) -> Self {
        return .init(top: 0, leading: 0, bottom: 0, trailing: trailing)
    }
    
    static func horizontal(_ edge: CGFloat) -> Self {
        return Self.horizontal(leading: edge, trailing: edge)
    }

    static func horizontal(leading: CGFloat, trailing: CGFloat) -> Self {
        return Self(top: 0, leading: leading, bottom: 0, trailing: trailing)
    }

    static func vertical(_ edge: CGFloat) -> Self {
        return Self.vertical(top: edge, bottom: edge)
    }

    static func vertical(top: CGFloat, bottom: CGFloat) -> Self {
        return Self(top: top, leading: 0, bottom: bottom, trailing: 0)
    }

    static func all(_ edge: CGFloat) -> Self {
        return Self(top: edge, leading: edge, bottom: edge, trailing: edge)
    }
}
