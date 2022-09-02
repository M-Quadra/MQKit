//
//  CGRect+Creator.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/26.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension CGRect {
    
    /// origin: .zero
    init(_ size: CGSize) {
        self.init(origin: .zero, size: size)
    }
}
