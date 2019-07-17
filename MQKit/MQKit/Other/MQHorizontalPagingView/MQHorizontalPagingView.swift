//
//  MQHorizontalPagingView.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public class MQHorizontalPagingView: UIView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let contentSizeKeyPath = "contentSize"
    
    public struct ViewInfo {
        
        let edgeSpacing: CGFloat
        let cellSpacing: CGFloat
        
        let cellWidth: CGFloat
        let pageWidth: CGFloat
        
        init(edgeSpacing:CGFloat, cellSpacing: CGFloat, cellWidth: CGFloat, pageWidth: CGFloat) {
            self.edgeSpacing = edgeSpacing
            self.cellSpacing = cellSpacing
            
            self.cellWidth = cellWidth
            self.pageWidth = pageWidth
        }
    }
    
    let viewInfo: ViewInfo
    
    private var _cellWidth: CGFloat = 0
    var cellWidth: CGFloat {
        get {
            return _cellWidth
        }
        set {
            let nValue = max(0, newValue)
            if nValue == _cellWidth {
                return
            }
            
            _cellWidth = nValue
            self.collectionView.reloadData()
        }
    }
    
    var cellCount = 0 {
        didSet {
            if oldValue != self.cellCount {
                self.collectionView.reloadData()
            }
        }
    }
    
    fileprivate let scrollViewDelegate = ScrollViewDelegate()
    fileprivate let scrollView: UIScrollView = {
        let scrView = UIScrollView(frame: .zero)
        
        scrView.isPagingEnabled = true
        scrView.alwaysBounceVertical = false
        return scrView
    }()
    
    fileprivate var lastContentSize = CGSize.zero
    fileprivate var lastHitTestPoint = CGPoint.zero
    fileprivate let collectionViewDelegate = CollectionViewDelegate()
    fileprivate let collectionView: MQCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        
        let cltView = MQCollectionView(frame: .zero, collectionViewLayout: layout)
        cltView.backgroundColor = .clear
        
        cltView.showsHorizontalScrollIndicator = false
        cltView.showsVerticalScrollIndicator   = false
        
        return cltView
    }()
    
    init(frame: CGRect, info: ViewInfo) {
        self.viewInfo = info
        super.init(frame: frame)
        
        self.scrollView.mq_width = self.viewInfo.pageWidth
        self.scrollView.delegate = self.scrollViewDelegate
        self.scrollViewDelegate.prePagingView = self
        
        self.lastContentSize = collectionView.contentSize
        self.collectionView.addObserver(self, forKeyPath: contentSizeKeyPath, options: .new, context: nil)
        
        self.collectionView.frame = self.bounds
        self.collectionViewDelegate.prePagingView = self
        self.collectionView.delegate   = self.collectionViewDelegate
        self.collectionView.dataSource = self.collectionViewDelegate
        self.addSubview(collectionView)
        
        weak var weakSelf = self
        self.collectionView.whenHitTest { (point, event) -> UIView? in
            guard let strongSelf = weakSelf else {
                return nil
            }
            
            strongSelf.lastHitTestPoint = point
            
            // 哪天需要手势判断再改
            strongSelf.scrollViewDelegate.lastOffset = strongSelf.scrollView.contentOffset
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                strongSelf.scrollViewDelegate.scrollViewDidEndDecelerating(strongSelf.scrollView)
            }
            return strongSelf.scrollView
        }
    }
    
    deinit {
        collectionView.removeObserver(self, forKeyPath: contentSizeKeyPath)
        #if DEBUG
        print(type(of: self), "deinit")
        #endif
    }
    
    // MARK: - KVO
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == self.contentSizeKeyPath else {
            return
        }
        guard object as AnyObject === self.collectionView else {
            return
        }
        
        var contentSiz = self.collectionView.contentSize
        let pageWidth = self.viewInfo.pageWidth
        if pageWidth < self.collectionView.mq_width {
            contentSiz.width -= self.collectionView.mq_width - pageWidth
        }
        
        if contentSiz == self.lastContentSize {
            return
        }
        self.lastContentSize = contentSiz
        
        self.scrollView.contentSize = contentSiz
        self.scrollView.contentOffset = self.collectionView.contentOffset
    }
    
    // MARK: - Delegate Closure
    typealias dequeueCellClosure<T> = (_: Int) -> Cell<T>
    
    fileprivate var dequeueCell = { (cltView: UICollectionView, idxPath: IndexPath) -> UICollectionViewCell in
        return cltView.mq_dequeue(reusableCell: MQReusableCell<UICollectionViewCell>.forIndexPath(idxPath))
    }
    fileprivate var willDisplay = { (cell: UICollectionViewCell, idxPath: IndexPath) in
    }
    
    func dequeueCell<T: UICollectionViewCell>(_ closure: @escaping dequeueCellClosure<T>) {
        self.dequeueCell = { (cltView: UICollectionView, idxPath: IndexPath) -> UICollectionViewCell in
            return cltView.mq_dequeue(reusableCell: MQReusableCell<T>.forIndexPath(idxPath))
        }
        
        self.willDisplay = { (cell: UICollectionViewCell, idxPath: IndexPath) in
            guard let willDisplay = closure(idxPath.item).willDisplay else {
                return
            }
            willDisplay(cell as! T)
        }
    }
    
    struct Cell<T> {
        
        typealias emptyClosure = (T) -> Void
        fileprivate var willDisplay: emptyClosure?
        
        static func cell() -> Cell {
            return .init()
        }
        
        static func willDisplay(_ closure: @escaping emptyClosure) -> Cell {
            var cell = Cell<T>()
            cell.willDisplay = closure
            return cell
        }
    }
    
    typealias didSelectCellClosure = (_: UICollectionView, _: Int) -> Void
    
    fileprivate var didSelectCell = { (cltView: UICollectionView, item: Int) in
    }
    
    func didSelectCell(_ closure: @escaping didSelectCellClosure) {
        self.didSelectCell = closure
    }
}

// MARK: - UIScrollView Delegate
fileprivate class ScrollViewDelegate: NSObject, UIScrollViewDelegate {
    
    weak var prePagingView: MQHorizontalPagingView?
    fileprivate var lastOffset = CGPoint.zero
    fileprivate var lastClickOffset = CGPoint.zero
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cltView = self.prePagingView?.collectionView else {
            return
        }
        
        let pit = CGPoint(x: scrollView.contentOffset.x, y: 0)
        cltView.setContentOffset(pit, animated: false)
    }
    
    // 可能出现无法触发scrollViewWillBeginDecelerating的情况，原因未知
    // hitTest内也会进行赋值
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        self.lastOffset = scrollView.contentOffset
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let pagingView = self.prePagingView else {
            return
        }
        let cltView = pagingView.collectionView
        guard scrollView.contentOffset.equalTo(self.lastOffset) else {
            return
        }
        guard !self.lastClickOffset.equalTo(pagingView.lastHitTestPoint) else {
            return
        }
        
        self.lastClickOffset = pagingView.lastHitTestPoint
        
        let hitTestPoint = self.prePagingView?.lastHitTestPoint ?? .zero
        let view = cltView.superHitTest(hitTestPoint, with: nil)
        
        if let ctrl = view as? UIControl, ctrl.isEnabled {
            ctrl.sendActions(for: .touchUpInside)
            return;
        }
        
        guard let cell = view as? UICollectionViewCell ?? view?.superview as? UICollectionViewCell else {
            return
        }
        guard let idxPath = cltView.indexPath(for: cell) else {
            return
        }
        
        pagingView.collectionViewDelegate.collectionView(cltView, didSelectItemAt: idxPath)
    }
}

// MARK: - UICollectionView Delegate/DataSource
fileprivate class CollectionViewDelegate: NSObject,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var prePagingView: MQHorizontalPagingView?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pgView = self.prePagingView else {
            return 0
        }
        
        return pgView.cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let pgView = self.prePagingView else {
            return .zero
        }
        let edge = pgView.viewInfo.edgeSpacing
        return .init(top: 0, left: edge, bottom: 0, right: edge)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let pgView = self.prePagingView else {
            return 0
        }
        return pgView.viewInfo.cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let pgView = self.prePagingView else {
            return .zero
        }
        
        let siz = CGSize(width: pgView.viewInfo.cellWidth, height: pgView.mq_height)
        return siz
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pgView = self.prePagingView else {
            return collectionView.mq_dequeue(reusableCell: MQReusableCell<UICollectionViewCell>(indexPath))
        }
        
        return pgView.dequeueCell(collectionView, indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let pgView = self.prePagingView else {
            return
        }
        
        pgView.willDisplay(cell, indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pgView = self.prePagingView else {
            return
        }
        
        pgView.didSelectCell(collectionView, indexPath.item)
    }
}
