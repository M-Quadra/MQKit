//
//  Uncheck.swift
//  MQKit
//
//  Created by m_quadra on 2024/8/19.
//

public struct Uncheck<Base>: @unchecked Sendable {
    
    public let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}
