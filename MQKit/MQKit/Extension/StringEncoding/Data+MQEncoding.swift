//
//  Data+MQEncoding.swift
//  MQKit
//
//  Created by M_Quadra on 2019/9/26.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension Data {
    
        var tsData = self
    var mq_autoEncoding: String.Encoding {
        if self.count > 100 {
            let flagSet: Set<UInt8> = [10, 13, 32]
            for i in 90..<self.count {
                if !flagSet.contains(self[i]) {
                    continue
                }
                
                tsData = self[0..<i]
                break
            }
        }
        
        let que = OperationQueue.mq_single
        
        let strEncodingAry = String.Encoding.mq_allValues
        var strIdx = 0
        var strCnt = Int.max
        DispatchQueue.concurrentPerform(iterations: strEncodingAry.count) { (i) in
            guard let tsStr = String(data: tsData, mq_encoding: strEncodingAry[i]) else {
                return
            }
            let cnt = Set(tsStr).count
            que.addOperation {
                if cnt >= strCnt {
                    return
                }
                strIdx = i
                strCnt = cnt
            }
        }
        
        let cfEncodingAry = CFStringEncodings.mq_AllValues
        var cfIdx = 0
        var cfCnt = Int.max
        DispatchQueue.concurrentPerform(iterations: cfEncodingAry.count) { (i) in
            guard let tsStr = String(data: tsData, mq_encoding: cfEncodingAry[i]) else {
                return
            }
            let cnt = Set(tsStr).count
            que.addOperation {
                if cnt >= cfCnt {
                    return
                }
                cfIdx = i
                cfCnt = cnt
            }
        }
        
        que.waitUntilAllOperationsAreFinished()
        if strCnt < cfCnt {
            return strEncodingAry[strIdx]
        }
        return cfEncodingAry[cfIdx].mq_StringEncoding
    }
    
    var mq_autoString: String? {
        return String(data: self, encoding: self.mq_autoEncoding)
    }
}
