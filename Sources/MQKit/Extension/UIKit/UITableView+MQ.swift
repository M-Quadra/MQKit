//
//  UITableView+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2024/9/28.
//

import UIKit

// MARK: - Register
public extension UITableView {
    
    func register(cells: consuming [UITableViewCell.Type]) {
        for cell in cells {
            let identifier = NSStringFromClass(cell)
            self.register(cell, forCellReuseIdentifier: consume identifier)
        }
    }
    
    func register(headerFooter: UITableViewHeaderFooterView.Type) {
        let identifier = NSStringFromClass(headerFooter)
        self.register(headerFooter, forHeaderFooterViewReuseIdentifier: consume identifier)
    }
}

// MARK: - Dequeue
public extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(_ cell: T.Type = T.self, for indexPath: IndexPath) -> T {
        let identifier = NSStringFromClass(cell)
        return self.dequeueReusableCell(withIdentifier: consume identifier, for: indexPath) as! T
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type = T.self) -> T {
        let identifier = NSStringFromClass(headerFooter)
        return self.dequeueReusableHeaderFooterView(withIdentifier: consume identifier) as! T
    }
}
