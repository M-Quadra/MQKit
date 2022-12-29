//
//  Array+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/1.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

public extension Array where Element == UInt8 {
    
    static func random(_ count: Int) -> Self {
        return (0..<count).map({_ in
            UInt8.random
        })
    }
}

public extension Array where Element: Hashable {
    
    var unique: [Element] {
        var arr = [Element]()
        var set = Set<Element>()
        for v in self where !set.contains(v) {
            arr.append(v)
            set.insert(v)
        }
        return arr
    }
}

public extension Array {
    
    func `subscript`(_ index: Int) -> Element? {
        if !(self.indices ~= index) { return nil }
        return self[index]
    }
}
