//
//  Uncheck.swift
//  MQKit
//
//  Created by m_quadra on 2024/8/19.
//

struct Uncheck<Base>: @unchecked Sendable, ~Copyable {
    
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}
