//
//  TaskWithTimeout.swift
//
//
//  Created by m_quadra on 2023/12/12.
//

import Foundation

fileprivate enum Errors: Error {
    case timeout
}

@available(iOS 13.0, *)
public func withTimeout<T: Sendable>(
    _ ms: Int,
    priority: TaskPriority = .medium,
    operation: @escaping @Sendable () async throws -> T
) async throws -> T {
    var timeoutTask: Task<(), Error>? = nil
    defer { timeoutTask?.cancel() }
    
    let stream = AsyncStream<Result<T, Error>> { cont in
        let baseTask = Task(priority: priority) {
            do {
                try await cont.yield(.success(operation()))
            } catch {
                cont.yield(.failure(error))
            }
            cont.finish()
        }
        
        timeoutTask = Task(priority: .high) {
            try await Task.sleep(nanoseconds: UInt64(ms)*NSEC_PER_MSEC)
            cont.yield(.failure(Errors.timeout))
            cont.finish()
            baseTask.cancel()
        }
    }
    
    for try await it in stream { return try it.get() }
    throw Errors.timeout
}
