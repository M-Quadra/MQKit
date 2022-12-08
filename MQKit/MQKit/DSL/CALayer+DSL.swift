//
//  CALayer+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/29.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension CALayerDSL where T: CALayer {
    
    @discardableResult
    func size(_ size: CGSize) -> Self {
        self.object?.frame.size = size
        return self
    }

    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        self.object?.frame.size = CGSize(width: width, height: height)
        return self
    }
    
    @discardableResult
    func size(_ edge: CGFloat) -> Self {
        self.object?.frame.size = CGSize(edge)
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        self.object?.backgroundColor = color?.cgColor
        return self
    }
}
