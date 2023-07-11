//
//  UICollectionViewLayout+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/10/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UICollectionViewLayout {
    
    func register(decorationView view: UICollectionReusableView.Type) {
        let kind = NSStringFromClass(view)
        self.register(view, forDecorationViewOfKind: kind)
    }
}
