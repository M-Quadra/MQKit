//
//  MLMultiArray+Randn.swift
//
//
//  Created by m_quadra on 2024/5/29.
//

import CoreML
import Accelerate
import MetalPerformanceShaders
import MetalPerformanceShadersGraph

public extension MLMultiArray {
    
    /// torch.randn([...]) * scale
    static func randn(
        shape: consuming [NSNumber],
        scale: Float = 1,
        dataType: MLMultiArrayDataType = .float32
    ) throws -> MLMultiArray {
        if #available(iOS 15.4, *) {
            return switch dataType {
            case .float16: try .randnMPS(shape: shape, scale: Double(scale), dataType: dataType)
            case .float32: try .randnMPS(shape: shape, scale: Double(scale), dataType: dataType)
            case .float64: try .randnFP64(shape: shape, scale: scale)
            default: throw Errors.msg("unsupported type")
            }
        }
        
        return try .randnFP32or64(shape: shape, scale: scale, dataType: dataType)
    }
}

extension MLMultiArray {
    
    @available(iOS 15.4, *)
    static func randnMPS(
        shape: consuming [NSNumber],
        scale: Double = 1,
        dataType: MLMultiArrayDataType = .float32,
        seed: Int = .random(in: 0..<Int.max)
    ) throws -> MLMultiArray {
        let opt = try MLMultiArray(shape: shape, dataType: dataType)
        let dType: MPSDataType = switch dataType {
        case .float32: .float32
        case .float16: .float16
        default: throw Errors.msg("unsupported type")
        }
        guard let op = MPSGraphRandomOpDescriptor(distribution: .normal, dataType: dType)
        else { throw Errors.msg("MPSGraphRandomOpDescriptor failed") }
        let graph = MPSGraph()
        op.samplingMethod = .boxMuller
        
        let ts0 = graph.randomTensor(withShape: [opt.count as NSNumber], descriptor: consume op, seed: seed, name: nil)
        let ts1 = graph.constant(scale, shape: [], dataType: dType)
        let ts2 = graph.multiplication(consume ts0, consume ts1, name: nil)
        
        guard let arr = graph.run(
            feeds: [:],
            targetTensors: [ts2],
            targetOperations: nil
        )[consume ts2]?.mpsndarray()
        else { throw Errors.msg("graph.run failed") }
        
        let ok = opt.withUnsafeMutableBytes { [arr = consume arr] ptr, _ in
            guard let dst = ptr.baseAddress else { return false }
            var size = arr.dataTypeSize
            arr.readBytes(consume dst, strideBytes: &size)
            return true
        }
        if !ok { throw Errors.msg("readBytes failed") }
        return opt
    }

    @available(iOS 15.4, *)
    static func randnFP64(
        shape: consuming [NSNumber],
        scale: Float = 1
    ) throws -> MLMultiArray {
        let ts = try MLMultiArray(shape: shape, dataType: .float64)
        var arr = boxMullerFP64(count: ts.count)
        if scale != 1 {
            vDSP_vsmulD(arr, 1, [Double(scale)], &arr, 1, vDSP_Length(arr.count))
        }
        
        let ok = ts.withUnsafeMutableBytes { ptr, _ in
            guard let dst = ptr.baseAddress else { return false }
            let dstPtr = memcpy(dst, arr, ts.count * MemoryLayout<Float64>.size)
            return dstPtr == dst
        }
        if !ok { throw Errors.msg("memcpy failed") }
        return ts
    }
    
    static func randnFP32or64(
        shape: consuming [NSNumber],
        scale: Float = 1,
        dataType: MLMultiArrayDataType = .float32
    ) throws -> MLMultiArray {
        let ts = try MLMultiArray(shape: shape, dataType: dataType)
        switch dataType {
        case .float32:
            var arr = boxMullerFP32(count: ts.count)
            if scale != 1 {
                vDSP_vsmul(arr, 1, [scale], &arr, 1, vDSP_Length(arr.count))
            }
            
            for i in 0..<ts.count {
                ts[i] = arr[i] as NSNumber
            }
        case .float64:
            var arr = boxMullerFP64(count: ts.count)
            if scale != 1 {
                vDSP_vsmulD(arr, 1, [Double(scale)], &arr, 1, vDSP_Length(arr.count))
            }
            
            for i in 0..<ts.count {
                ts[i] = arr[i] as NSNumber
            }
        default:
            throw Errors.msg("unsupported type")
        }
        
        return ts
    }
}

fileprivate func boxMullerFP32(count: Int) -> [Float32] {
    let mean: Float = 0.0, std: Float = 1.0
    var arr = (0..<(count/16 + 1) * 16).map { _ in Float32.random(in: 0..<1) }
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
    return arr
}
fileprivate func boxMullerFP64(count: Int) -> [Float64] {
    let mean: Float64 = 0.0, std: Float64 = 1.0
    var arr = (0..<(count/16 + 1) * 16).map { _ in Float64.random(in: 0..<1) }
    for i in stride(from: 0, to: arr.count, by: 16) {
        for j in i..<(i+8) {
            let u1 = 1 - arr[j]
            let u2 = arr[j + 8]
            let radius = sqrt(-2 * log(u1))
            let theta = 2 * Float64.pi * u2
            
            arr[j] = radius * cos(theta) * std + mean
            arr[j+8] = radius * sin(theta) * std + mean
        }
    }
    return arr
}
