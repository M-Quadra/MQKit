//
//  MQCollectionView.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public class MQCollectionView: UICollectionView {
    
    // MARK: - hitTest
    public typealias hitTestClosure = (_: CGPoint, _: UIEvent?) -> UIView?
    private var preWhenHitTest: hitTestClosure?
    public func whenHitTest(whenHitTest: hitTestClosure?) {
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
    fileprivate lazy var headIdentifierSet = Set<String>()
    fileprivate lazy var footIdentifierSet = Set<String>()
}

public struct MQReusableCell<T> {
    let idxPath: IndexPath
    
    init(_ idxPath: IndexPath) {
        self.idxPath = idxPath
    }
    
    static func forIndexPath(_ idxPath: IndexPath) -> MQReusableCell {
        return MQReusableCell<T>(idxPath)
    }
}

public struct MQReusableView<T> {
    let idxPath: IndexPath
    
    init(_ idxPath: IndexPath) {
        self.idxPath = idxPath
    }
    
    static func forIndexPath(_ idxPath: IndexPath) -> MQReusableView {
        return MQReusableView<T>(idxPath)
    }
}

extension UICollectionView {
    
    public func mq_dequeue<T: UICollectionViewCell>(reusableCell: MQReusableCell<T>) -> T {
        let cls = T.self
        let clsName = NSStringFromClass(cls)
        
        if let mqCltView = self as? MQCollectionView {
            if !mqCltView.cellIdentifierSet.contains(clsName) {
                mqCltView.register(cls, forCellWithReuseIdentifier: clsName)
                mqCltView.cellIdentifierSet.insert(clsName)
            }
        }
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: clsName, for: reusableCell.idxPath)
        return cell as! T
    }
    
    public func mq_dequeue<T: UICollectionReusableView>(reusableHeader: MQReusableView<T>) -> T {
        let cls = T.self
        let clsName = NSStringFromClass(cls)
        let kind = UICollectionView.elementKindSectionHeader
        
        if let mqCltView = self as? MQCollectionView {
            if !mqCltView.headIdentifierSet.contains(clsName) {
                mqCltView.register(cls, forSupplementaryViewOfKind: kind, withReuseIdentifier: clsName)
                mqCltView.headIdentifierSet.insert(clsName)
            }
        }
        
        let foot = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: clsName, for: reusableHeader.idxPath)
        return foot as! T
    }
    
    public func mq_dequeue<T: UICollectionReusableView>(reusableFooter: MQReusableView<T>) -> T {
        let cls = T.self
        
        let clsName = NSStringFromClass(cls)
        let kind = UICollectionView.elementKindSectionFooter
        
        if let mqCltView = self as? MQCollectionView {
            if !mqCltView.footIdentifierSet.contains(clsName) {
                mqCltView.register(cls, forSupplementaryViewOfKind: kind, withReuseIdentifier: clsName)
                mqCltView.footIdentifierSet.insert(clsName)
            }
        }
        
        let foot = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: clsName, for: reusableFooter.idxPath)
        return foot as! T
    }
}
