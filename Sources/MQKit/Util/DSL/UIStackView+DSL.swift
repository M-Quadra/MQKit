//
//  UIStackView+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2023/8/10.
//

import UIKit

public extension UIViewDSL where T: UIStackView {
    
    @discardableResult
    func addArrangedSubview(_ view: UIView) -> Self {
        self.object.addArrangedSubview(view)
        return self
    }

    @discardableResult
    func addArrangedSubviews(_ views: [UIView]) -> Self {
        views.forEach { self.object.addArrangedSubview($0) }
        return self
    }

    @discardableResult
    func removeArrangedSubview(_ view: UIView) -> Self {
        self.object.removeArrangedSubview(view)
        return self
    }

    @discardableResult
    func insertArrangedSubview(_ view: UIView, at stackIndex: Int) -> Self {
        self.object.insertArrangedSubview(view, at: stackIndex)
        return self
    }

    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.object.axis = axis
        return self
    }

    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.object.distribution = distribution
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.object.alignment = alignment
        return self
    }

    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.object.spacing = spacing
        return self
    }

    @discardableResult
    func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) -> Self {
        self.object.setCustomSpacing(spacing, after: arrangedSubview)
        return self
    }

    @discardableResult
    func customSpacing(after arrangedSubview: UIView) -> CGFloat {
        return self.object.customSpacing(after: arrangedSubview)
    }

    @discardableResult
    func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool) -> Self {
        self.object.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }

    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool) -> Self {
        self.object.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }
}
