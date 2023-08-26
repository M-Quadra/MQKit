//
//  UIView+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/10.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension UIView {
    
    var parentViewController: UIViewController? {
        var responder = self.next
        while responder != nil {
            if let vc = responder as? UIViewController {
                return vc
            }
            responder = responder?.next
        }
        return nil
    }
    
    func setShadow(offset: CGSize, effect: CGFloat, color: UIColor) {
        self.layer.shadowColor   = color.cgColor
        self.layer.shadowOffset  = offset
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius  = effect
    }
    
    func shadowPathToFit() {
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self {
        for view in views {
            self.addSubview(view)
        }
        return self
    }
}
