//
//  UIScrollView+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/17.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIViewDSL where T: UIScrollView {
    
    @discardableResult
    func contentInset(_ contentInset: UIEdgeInsets) -> Self {
        self.object.contentInset = contentInset
        return self
    }

    @discardableResult
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        self.object.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool) -> Self {
        self.object.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
        return self
    }

    @discardableResult
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self {
        self.object.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }

    @discardableResult
    func bounces(_ bounces: Bool) -> Self {
        self.object.bounces = bounces
        return self
    }

    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        self.object.alwaysBounceVertical = alwaysBounceVertical
        return self
    }

    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        self.object.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }

    @discardableResult
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        self.object.isPagingEnabled = isPagingEnabled
        return self
    }

    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.object.isScrollEnabled = isScrollEnabled
        return self
    }

    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        self.object.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }

    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        self.object.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }

    @discardableResult
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> Self {
        self.object.indicatorStyle = indicatorStyle
        return self
    }

    @available(iOS 11.1, *)
    @discardableResult
    func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.object.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
        return self
    }

    @available(iOS 11.1, *)
    @discardableResult
    func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.object.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
        return self
    }

    @discardableResult
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.object.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }

    @discardableResult
    func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate) -> Self {
        self.object.decelerationRate = decelerationRate
        return self
    }

    @discardableResult
    func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode) -> Self {
        self.object.indexDisplayMode = indexDisplayMode
        return self
    }

    @discardableResult
    func delaysContentTouches(_ delaysContentTouches: Bool) -> Self {
        self.object.delaysContentTouches = delaysContentTouches
        return self
    }

    @discardableResult
    func canCancelContentTouches(_ canCancelContentTouches: Bool) -> Self {
        self.object.canCancelContentTouches = canCancelContentTouches
        return self
    }

    @discardableResult
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> Self {
        self.object.minimumZoomScale = minimumZoomScale
        return self
    }

    @discardableResult
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> Self {
        self.object.maximumZoomScale = maximumZoomScale
        return self
    }

    @discardableResult
    func zoomScale(_ zoomScale: CGFloat) -> Self {
        self.object.zoomScale = zoomScale
        return self
    }

    @discardableResult
    func bouncesZoom(_ bouncesZoom: Bool) -> Self {
        self.object.bouncesZoom = bouncesZoom
        return self
    }

    @discardableResult
    func scrollsToTop(_ scrollsToTop: Bool) -> Self {
        self.object.scrollsToTop = scrollsToTop
        return self
    }

    @discardableResult
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> Self {
        self.object.keyboardDismissMode = keyboardDismissMode
        return self
    }

    @discardableResult
    func refreshControl(_ refreshControl: UIRefreshControl?) -> Self {
        self.object.refreshControl = refreshControl
        return self
    }
}
