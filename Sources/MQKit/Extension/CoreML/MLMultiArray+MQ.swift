//
//  MLMultiArray+MQ.swift
//
//
//  Created by m_quadra on 2024/3/13.
//

import CoreML

public extension MLMultiArray {
    
    /// torch.randn([...]) * scale
    static func randn(
        shape: [NSNumber], dataType: MLMultiArrayDataType = .float32,
        scale: Double = 1
    ) throws -> MLMultiArray {
        let ts = try MLMultiArray(shape: shape, dataType: dataType)
        
        // Box-Muller
        let mean = 0.0, std = 1.0
        let arr = (0..<(ts.count/16 + 1) * 16).map { _ in Double.random(in: 0..<1) }
        
        var i = 0
        while i < ts.count {
            for j in i..<(i+8) {
                let u1 = 1 - arr[j]
                let u2 = arr[j + 8]
                let radius = sqrt(-2 * log(u1))
                let theta = 2 * Double.pi * u2
                
                let z0 = radius * cos(theta) * std + mean
                let z1 = radius * sin(theta) * std + mean
                if j < ts.count { ts[j] = z0 * scale as NSNumber }
                else { return ts }
                if j+8 < ts.count { ts[j+8] = z1 * scale as NSNumber }
            }
            i += 16
        }
        return ts
    }
    
    /// torch.Tensor([...]).men
    var mean: Double {
        let arr = (0..<self.count).map { self[$0].doubleValue }
        return arr.reduce(into: 0.0) { $0 += $1/Double(arr.count) }
    }
    
    /// torch.Tensor([...]).var
    var variance: Double {
        let arr = (0..<self.count).map { self[$0].doubleValue }
        
        let mean = arr.reduce(into: 0.0) { $0 += $1/Double(arr.count) }
        let var_ = arr.map { pow($0 - mean, 2) }
            .reduce(into: 0.0) { $0 += $1/Double(arr.count) }
        return var_
    }
}
