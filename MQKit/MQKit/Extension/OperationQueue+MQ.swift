//
//  OperationQueue+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/29.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension OperationQueue {
    
    static var mq_single: OperationQueue {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }
    
    static var mq_mid: OperationQueue {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = max(1, UIDevice.current.mq_cpuThreads/2)
        return queue
    }
    
    static var mq_max: OperationQueue {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = max(1, UIDevice.current.mq_cpuThreads)
        return queue
    }
}
