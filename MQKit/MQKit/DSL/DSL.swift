//
//  DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/29.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

public class ObjectDSL<T: AnyObject> {
    
    public weak internal(set) var object: T?
    
    required init(_ object: T) {
        self.object = object
    }
}

public func dsl<T: NSObject>(for klass: T.Type = T.self, closure: (_ make: ObjectDSL<T>) -> Void) -> T {
    let obj = klass.init()
    let dsl = ObjectDSL(obj)
    closure(dsl)
    return obj
}

public func dsl<T: NSObject>(for object: T, closure: (_ make: ObjectDSL<T>) -> Void) -> T {
    let dsl = ObjectDSL(object)
    closure(dsl)
    return object
}
