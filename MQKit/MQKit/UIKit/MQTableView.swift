//
//  MQTableView.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQTableView: UITableView {
    
    typealias hitTestClosure = (_: CGPoint, _: UIEvent?) -> UIView?
    private var preWhenHitTest: hitTestClosure?
    public func whenHitTest(whenHitTest: hitTestClosure?) -> Void {
        preWhenHitTest = whenHitTest
    }
    
    private var inOutsideHitTest = false
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let whenHitTest = preWhenHitTest else {
            return super.hitTest(point, with: event)
        }
        
        return whenHitTest(point, event)
    }

}

