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
        guard let whenHitTest = preWhenHitTest else {
            return super.hitTest(point, with: event)
        }
        
        return whenHitTest(point, event)
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

extension MQCollectionView {
    
    public func dequeue<T>(reusableCell: MQReusableCell<T>) -> T {
        guard let cls = T.self as? AnyClass else {
            fatalError("need __kindof UICollectionViewCell")
        }
        guard let _ = cls as? UICollectionViewCell.Type else {
            fatalError("need __kindof UICollectionViewCell")
        }
        
        let clsName = NSStringFromClass(cls)
        
        if !self.cellIdentifierSet.contains(clsName) {
            self.register(cls, forCellWithReuseIdentifier: clsName)
            self.cellIdentifierSet.insert(clsName)
        }
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: clsName, for: reusableCell.idxPath)
        return cell as! T
    }
    
    public func dequeue<T>(reusableHeader: MQReusableView<T>) -> T {
        guard let cls = T.self as? AnyClass else {
            fatalError("need __kindof UICollectionReusableView")
        }
        guard let _ = cls as? UICollectionReusableView.Type else {
            fatalError("need __kindof UICollectionReusableView")
        }
        
        let clsName = NSStringFromClass(cls)
        let kind = UICollectionView.elementKindSectionHeader
        
        if !self.headIdentifierSet.contains(clsName) {
            self.register(cls, forSupplementaryViewOfKind: kind, withReuseIdentifier: clsName)
            self.headIdentifierSet.insert(clsName)
        }
        
        let foot = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: clsName, for: reusableHeader.idxPath)
        return foot as! T
    }
    
    public func dequeue<T>(reusableFooter: MQReusableView<T>) -> T {
        guard let cls = T.self as? AnyClass else {
            fatalError("need __kindof UICollectionReusableView")
        }
        guard let _ = cls as? UICollectionReusableView.Type else {
            fatalError("need __kindof UICollectionReusableView")
        }
        
        let clsName = NSStringFromClass(cls)
        let kind = UICollectionView.elementKindSectionFooter
        
        if !self.footIdentifierSet.contains(clsName) {
            self.register(cls, forSupplementaryViewOfKind: kind, withReuseIdentifier: clsName)
            self.footIdentifierSet.insert(clsName)
        }
        
        let foot = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: clsName, for: reusableFooter.idxPath)
        return foot as! T
    }
}


