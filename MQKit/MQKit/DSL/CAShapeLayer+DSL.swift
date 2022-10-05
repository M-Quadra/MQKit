//
//  CAShapeLayer+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/29.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension ObjectDSL where T: CAShapeLayer {
    
    @discardableResult
    func fillColor(_ color: UIColor) -> Self {
        self.object?.fillColor = color.cgColor
        return self
    }

    @discardableResult
    func strokeColor(_ color: UIColor) -> Self {
        self.object?.strokeColor = color.cgColor
        return self
    }

    @discardableResult
    func lineWidth(_ width: CGFloat) -> Self {
        self.object?.lineWidth = width
        return self
    }

    @discardableResult
    func lineJoin(_ lineJoin: CAShapeLayerLineJoin) -> Self {
        self.object?.lineJoin = lineJoin
        return self
    }

    @discardableResult
    func lineCap(_ lineCap: CAShapeLayerLineCap) -> Self {
        self.object?.lineCap = lineCap
        return self
    }

    @discardableResult
    func path(_ path: UIBezierPath) -> Self {
        self.object?.path = path.cgPath
        return self
    }
}
