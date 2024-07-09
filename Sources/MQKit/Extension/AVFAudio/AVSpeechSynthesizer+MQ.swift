//
//  AVSpeechSynthesizer+MQ.swift
//
//
//  Created by m_quadra on 2024/5/16.
//

import AVFAudio

public extension AVSpeechSynthesizer {
    
    @available(iOS 13.0, *)
    func generateBuffer(_ utt: borrowing AVSpeechUtterance) async -> AVAudioPCMBuffer? {
        let bufs = await AsyncStream<AVAudioPCMBuffer> { cont in
            self.write(utt) { buffer in
                guard let buffer = buffer as? AVAudioPCMBuffer,
                      buffer.frameLength > 1
                else { return cont.finish() }
                cont.yield(consume buffer)
            }
        }.reduce(into: [AVAudioPCMBuffer]()) { $0.append($1) }
        return merge(buffers: consume bufs)
    }
}

fileprivate func merge(buffers iptBufs: [AVAudioPCMBuffer]) -> AVAudioPCMBuffer? {
    guard let fmt = iptBufs.first?.format,
          fmt.channelCount == 1,
          fmt.commonFormat == .pcmFormatFloat32
    else { return nil }
    
    let len = iptBufs.reduce(0) { $0 + $1.frameLength }
    guard let optBuf = AVAudioPCMBuffer(pcmFormat: consume fmt, frameCapacity: len),
          let ptr = optBuf.floatChannelData?[0]
    else { return nil }
    
    var offset: AVAudioFrameCount = 0
    for buf in iptBufs {
        guard let src = buf.floatChannelData?[0] else { return nil }
        memcpy(ptr + Int(offset), consume src, Int(buf.frameLength) * MemoryLayout<Float>.size)
        offset += buf.frameLength
    }
    optBuf.frameLength = consume len
    return optBuf
}

