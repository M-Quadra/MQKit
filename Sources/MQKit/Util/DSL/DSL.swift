//
//  DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/29.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

// MARK: - CALayer
public class CALayerDSL<T: CALayer> {
    
    public weak fileprivate(set) var object: T?
    
    required init(_ object: T) {
        self.object = object
    }
}

public func dsl<T: CALayer>(
    for klass: T.Type = T.self,
    closure: (_ make: CALayerDSL<T>) -> Void
) -> T {
    let obj = klass.init()
    let dsl = CALayerDSL(obj)
    closure(dsl)
    return obj
}

public func dsl<T: CALayer>(
    for object: T,
    closure: (_ make: CALayerDSL<T>) -> Void
) -> T {
    let dsl = CALayerDSL(object)
    closure(dsl)
    return object
}

// MARK: - Dictionary
public class DictionaryDSL<Key: Hashable, Value> {
    
    var dic: [Key: Value]
    
    required init(_ dic: Dictionary<Key, Value>) {
        self.dic = dic
    }
}

public func dsl<Key: Hashable, Value>(
    for dic: Dictionary<Key, Value> = [:],
    closure: (_ make: DictionaryDSL<Key, Value>) -> Void
) -> Dictionary<Key, Value> {
    let dsl = DictionaryDSL(dic)
    closure(dsl)
    return dsl.dic
}
