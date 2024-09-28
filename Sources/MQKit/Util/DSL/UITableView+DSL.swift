//
//  UITableView+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2024/9/28.
//

import UIKit

public extension UIViewDSL<UITableView> {
    
    @discardableResult
    consuming func dataSource(_ dataSource: (any UITableViewDataSource)) -> Self {
        self.object.dataSource = dataSource
        return self
    }

    @discardableResult
    consuming func delegate(_ delegate: (any UITableViewDelegate)) -> Self {
        self.object.delegate = delegate
        return self
    }

    @discardableResult
    consuming func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.object.rowHeight = rowHeight
        return self
    }

    @discardableResult
    consuming func layoutMargins(_ layoutMargins: UIEdgeInsets) -> Self {
        self.object.layoutMargins = layoutMargins
        return self
    }
}

// MARK: - MQ
public extension UIViewDSL<UITableView> {

    @discardableResult
    consuming func register(cells: consuming [UITableViewCell.Type]) -> Self {
        self.object.register(cells: cells)
        return self
    }
}
