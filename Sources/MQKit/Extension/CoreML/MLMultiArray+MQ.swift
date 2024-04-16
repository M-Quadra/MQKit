//
//  MLMultiArray+MQ.swift
//
//
//  Created by m_quadra on 2024/3/13.
//

import CoreML
import Accelerate

public extension MLMultiArray {
    
    /// torch.randn([...]) * scale
    static func randn(
        shape: [NSNumber],
        dataType: MLMultiArrayDataType = .float32,
        scale: Float = 1
    ) throws -> MLMultiArray {
        let ts = try MLMultiArray(shape: shape, dataType: dataType)
        
        // Box-Muller
        let mean: Float = 0.0, std: Float = 1.0
        var arr = (0..<(ts.count/16 + 1) * 16).map { _ in Float.random(in: 0..<1) }
        
        for i in stride(from: 0, to: arr.count, by: 16) {
            for j in i..<(i+8) {
                let u1 = 1 - arr[j]
                let u2 = arr[j + 8]
                let radius = sqrt(-2 * log(u1))
                let theta = 2 * Float.pi * u2
                
                arr[j] = radius * cos(theta) * std + mean
                arr[j+8] = radius * sin(theta) * std + mean
            }
        }
        
        if scale != 1 {
            vDSP_vsmul(arr, 1, [scale], &arr, 1, vDSP_Length(arr.count))
        }
        
        if #available(iOS 15.4, *), ts.dataType == .float32 {
            let ok = ts.withUnsafeMutableBytes { ptr, _ in
                guard let dst = ptr.baseAddress else { return false }
                let dstPtr = memcpy(dst, arr, ts.count * MemoryLayout<Float>.size)
                return dstPtr == dst
            }
            if ok { return ts }
        }
        
        for i in 0..<ts.count {
            ts[i] = arr[i] as NSNumber
        }
        return ts
    }
    
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
