//
//  MLMultiArray+MQ.swift
//
//
//  Created by m_quadra on 2024/3/13.
//

import CoreML
import Accelerate

public extension MLMultiArray {
    
    /// torch.Tensor([...]).men
    var mean: Double {
        if #available(iOS 15.4, *) {
            switch self.dataType {
            case .float32:
                let mean = self.withUnsafeBufferPointer(ofType: Float.self) { ptr -> Float? in
                    guard let ptr = ptr.baseAddress else { return nil }
                    var mean: Float = 0
                    vDSP_meanv(ptr, 1, &mean, vDSP_Length(self.count))
                    return mean
                }
                if let mean = mean { return Double(mean) }
            case .float64:
                let mean = self.withUnsafeBufferPointer(ofType: Double.self) { ptr -> Double? in
                    guard let ptr = ptr.baseAddress else { return nil }
                    var mean: Double = 0
                    vDSP_meanvD(ptr, 1, &mean, vDSP_Length(self.count))
                    return mean
                }
                if let mean = mean { return mean }
            default: break
            }
        }
        
        let arr = (0..<self.count).map { self[$0].doubleValue }
        return arr.reduce(into: 0.0) { $0 += $1/Double(arr.count) }
    }
    
    /// torch.Tensor([...]).var
    var variance: Double {
        let arr = (0..<self.count).map { self[$0].doubleValue }
        
        let mean = self.mean
        let var_ = arr.map { pow($0 - mean, 2) }
            .reduce(into: 0.0) { $0 += $1/Double(arr.count) }
        return var_
    }
}
