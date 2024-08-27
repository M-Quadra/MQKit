//
//  AVAudioConverter+MQ.swift
//
//
//  Created by m_quadra on 2024/4/7.
//

import AVFAudio

public extension AVAudioConverter {
    
    func convert(data: consuming Data) throws -> AVAudioPCMBuffer {
        let iptBuf = switch self.inputFormat.commonFormat {
        case .pcmFormatInt16:
            try self.createInputBufferInt16(data)
        case .pcmFormatInt32:
            try self.createInputBufferInt32(data)
        case .pcmFormatFloat32:
            try self.createInputBufferFloat32(data)
        case .pcmFormatFloat64:
            try self.createInputBufferFloat64(data)
        default:
            throw Errors.msg("Unsupported format")
        }
        
        return try self.convert(consume iptBuf)
    }
    
    func convert(_ iptBuf: AVAudioPCMBuffer) throws -> AVAudioPCMBuffer {
        if iptBuf.format == self.outputFormat { return iptBuf }
        let optBuf = try self.createOutputBuffer(from: iptBuf)
        self.reset()
        
        var err: NSError?
        self.convert(to: optBuf, error: &err) { packetCount, statusPtr in
            statusPtr.pointee = .haveData
            return iptBuf
        }
        if let err = err { throw err }
        
        return optBuf
    }
}

// MARK: - Private
fileprivate extension AVAudioConverter {
    
    func createInputBufferInt16(_ data: Data) throws -> AVAudioPCMBuffer {
        let iptFmt = self.inputFormat
        guard let iptBuf = AVAudioPCMBuffer(pcmFormat: iptFmt, frameCapacity: AVAudioFrameCount(data.count / MemoryLayout<Int16>.size)),
              let dst = iptBuf.int16ChannelData?[0]
        else { throw Errors.msg("Failed to create input buffer") }
        try data.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { throw Errors.msg("Failed to copy data") }
            _ = memcpy(dst, src, data.count)
        }
        iptBuf.frameLength = iptBuf.frameCapacity
        return iptBuf
    }

    func createInputBufferInt32(_ data: Data) throws -> AVAudioPCMBuffer {
        let iptFmt = self.inputFormat
        guard let iptBuf = AVAudioPCMBuffer(pcmFormat: iptFmt, frameCapacity: AVAudioFrameCount(data.count / MemoryLayout<Int32>.size)),
              let dst = iptBuf.int32ChannelData?[0]
        else { throw Errors.msg("Failed to create input buffer") }
        try data.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { throw Errors.msg("Failed to copy data") }
            _ = memcpy(dst, src, data.count)
        }
        iptBuf.frameLength = iptBuf.frameCapacity
        return iptBuf
    }

    func createInputBufferFloat32(_ data: Data) throws -> AVAudioPCMBuffer {
        let iptFmt = self.inputFormat
        guard let iptBuf = AVAudioPCMBuffer(pcmFormat: iptFmt, frameCapacity: AVAudioFrameCount(data.count / MemoryLayout<Float32>.size)),
              let dst = iptBuf.floatChannelData?[0]
        else { throw Errors.msg("Failed to create input buffer") }
        try data.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { throw Errors.msg("Failed to copy data") }
            _ = memcpy(dst, src, data.count)
        }
        iptBuf.frameLength = iptBuf.frameCapacity
        return iptBuf
    }

    func createInputBufferFloat64(_ data: Data) throws -> AVAudioPCMBuffer {
        let iptFmt = self.inputFormat
        guard let iptBuf = AVAudioPCMBuffer(pcmFormat: iptFmt, frameCapacity: AVAudioFrameCount(data.count / MemoryLayout<Double>.size)),
              let dst = iptBuf.floatChannelData?[0]
        else { throw Errors.msg("Failed to create input buffer") }
        try data.withUnsafeBytes { ptr in
            guard let src = ptr.baseAddress else { throw Errors.msg("Failed to copy data") }
            _ = memcpy(dst, src, data.count)
        }
        iptBuf.frameLength = iptBuf.frameCapacity
        return iptBuf
    }
    
    func createOutputBuffer(from iptBuf: AVAudioPCMBuffer) throws -> AVAudioPCMBuffer {
        let optFmt = self.outputFormat
        let len = Double(iptBuf.frameLength) / iptBuf.format.sampleRate * optFmt.sampleRate
        guard let optBuf = AVAudioPCMBuffer(pcmFormat: consume optFmt, frameCapacity: AVAudioFrameCount(max(0, len)))
        else { throw Errors.msg("Failed to create output buffer") }        
        return optBuf
    }
}
