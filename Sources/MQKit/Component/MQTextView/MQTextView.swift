//
//  MQTextView.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

open class MQTextView: UITextView {
    public var minHeight: CGFloat = 10
    public var maxHeight: CGFloat = .max
}

// MARK: - Override
public extension MQTextView {
    
    override var contentSize: CGSize { didSet {
        self.invalidateIntrinsicContentSize()
    }}
    
    override var intrinsicContentSize: CGSize {
        let size = self.contentSize
        switch size.height {
        case ...self.minHeight:
            return CGSize(width: size.width, height: self.frame.height)
        case self.maxHeight...:
            return CGSize(width: size.width, height: self.maxHeight)
        default: break
        }
        
        let h = size.height + self.contentInset.top + self.contentInset.bottom
        return CGSize(
            width: size.width,
            height: clamp(low: self.minHeight, value: consume h, high: self.maxHeight)
        )
    }
    
    override var contentOffset: CGPoint {
        get {
            return super.contentOffset
        }
        set {
            var newValue = newValue
            newValue.x -= self.contentInset.left
            super.contentOffset = newValue
        }
    }
}
