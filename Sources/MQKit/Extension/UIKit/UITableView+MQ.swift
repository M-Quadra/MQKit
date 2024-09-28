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
}

// MARK: - Dequeue
public extension UITableView {
    
    func dequeue<T: UITableViewCell>(cell: T.Type = T.self, for indexPath: IndexPath) -> T {
        let identifier = NSStringFromClass(cell)
        return self.dequeueReusableCell(withIdentifier: consume identifier, for: indexPath) as! T
    }
}
