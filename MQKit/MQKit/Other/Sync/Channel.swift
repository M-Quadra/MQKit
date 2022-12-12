//
//  Channel.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/22.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

/// FIFO
@available(iOS 13, *)
public struct Channel<T: Sendable> {
    
    fileprivate class Builder {
        
        var continuation: AsyncStream<T>.Continuation?
        lazy var stream = AsyncStream<T>.init { [weak self] continuation in
            guard let self = self else { return }
            
            self.continuation = continuation
        }
    }
    
    fileprivate let continuation: AsyncStream<T>.Continuation
    fileprivate let stream: AsyncStream<T>
    
    public init() {
        let b = Builder()
        self.stream = b.stream
        self.continuation = b.continuation!
    }
}

// MARK: - Public
@available(iOS 13, *)
public extension Channel {
    
    func close() {
        self.continuation.finish()
    }
    
    func push(_ v: T) {
        self.continuation.yield(v)
    }
    
    @discardableResult
    func byPop() async -> T? {
        var it = self.stream.makeAsyncIterator()
        let opt = await it.next()
        return opt
    }
}
