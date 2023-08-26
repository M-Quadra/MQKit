//
//  MQTextView.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public class MQTextView: UITextView {
    
    public var minHeight: CGFloat = 10
    public var maxHeight: CGFloat = .max
}

// MARK: - Override
public extension MQTextView {
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            let size = super.contentSize
            return CGSize(
                width: size.width,
                height: min(max(self.minHeight, size.height), self.maxHeight)
            )
        }
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
