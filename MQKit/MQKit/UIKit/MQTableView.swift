//
//  MQTableView.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQTableView: UITableView {
    
    // MARK: - hitTest
    typealias hitTestClosure = (_: CGPoint, _: UIEvent?) -> UIView?
    private var preWhenHitTest: hitTestClosure?
    public func whenHitTest(whenHitTest: hitTestClosure?) -> Void {
        preWhenHitTest = whenHitTest
    }
    
    private var inOutsideHitTest = false
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let whenHitTest = preWhenHitTest, !self.inOutsideHitTest else {
            return self.superHitTest(point, with: event)
        }
        
        self.inOutsideHitTest = true
        let rtn = whenHitTest(point, event)
        self.inOutsideHitTest = false
        
        return rtn
    }

    public func superHitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return super.hitTest(point, with: event)
    }
    
    // MARK: - dequeueReusable
    fileprivate lazy var cellIdentifierSet = Set<String>()
    fileprivate lazy var headFootIdentifierSet = Set<String>()
}

extension UITableView {
    
    public func mq_dequeue<T: UITableViewCell>(reusableCell: MQReusableCell<T>) -> T {
        let cls = T.self
        let clsName = NSStringFromClass(cls)
        
        if let mqTbView = self as? MQTableView {
            if !mqTbView.cellIdentifierSet.contains(clsName) {
                mqTbView.register(cls, forCellReuseIdentifier: clsName)
                mqTbView.cellIdentifierSet.insert(clsName)
            }
        }
        
        let cell = self.dequeueReusableCell(withIdentifier: clsName, for: reusableCell.idxPath)
        return cell as! T
    }
    
    public func mq_dequeue<T: UIView>(reusableHeaderFooter: MQReusableView<T>) -> T? {
        let cls = T.self
        let clsName = NSStringFromClass(cls)

        if let mqTbView = self as? MQTableView {
            if !mqTbView.headFootIdentifierSet.contains(clsName) {
                mqTbView.register(cls, forHeaderFooterViewReuseIdentifier: clsName)
                mqTbView.headFootIdentifierSet.insert(clsName)
            }
        }
        
        let headFoot = self.dequeueReusableHeaderFooterView(withIdentifier: clsName)
        return headFoot as? T
    }
}
