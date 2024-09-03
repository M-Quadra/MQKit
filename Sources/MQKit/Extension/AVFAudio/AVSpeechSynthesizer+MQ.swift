//
//  AVSpeechSynthesizer+MQ.swift
//
//
//  Created by m_quadra on 2024/5/16.
//

import AVFAudio

public extension AVSpeechSynthesizer {
    
#if swift(<6)
    func generateBuffer(_ utt: consuming AVSpeechUtterance) async -> AVAudioPCMBuffer? {
        let bufs = await self.generateStream(utt)
            .reduce(into: [AVAudioPCMBuffer]()) { $0.append($1.base) }
        let buf = merge(buffers: consume bufs)
        return buf
    }
#else
    @available(*, deprecated, message: "在外部手动实现")
    func generateBuffer(_ utt: consuming AVSpeechUtterance) async -> AVAudioPCMBuffer? { nil }
#endif
    
    func generateStream(_ utt: consuming AVSpeechUtterance) -> AsyncStream<Uncheck<AVAudioPCMBuffer>> {
        return AsyncStream<Uncheck<AVAudioPCMBuffer>> { [utt = utt] cont in
            self.write(utt) { buffer in
                guard let buffer = buffer as? AVAudioPCMBuffer,
                      buffer.frameLength > 1
                else { return cont.finish() }
                cont.yield(Uncheck(consume buffer))
            }
        }
    }
}

fileprivate func merge(buffers iptBufs: [AVAudioPCMBuffer]) -> AVAudioPCMBuffer? {
    guard let fmt = iptBufs.first?.format,
          fmt.channelCount == 1
    else { return nil }
    let len = iptBufs.reduce(0) { $0 + $1.frameLength }
    guard let optBuf = AVAudioPCMBuffer(pcmFormat: fmt, frameCapacity: len) else { return nil }
    
    switch fmt.commonFormat {
    case .pcmFormatFloat32:
        guard var dst = optBuf.floatChannelData?[0] else { return nil }
        for buf in iptBufs {
            guard let src = buf.floatChannelData?[0] else { return nil }
            dst.update(from: src, count: Int(buf.frameLength))
            dst += Int(buf.frameLength)
        }
        optBuf.frameLength = len
        return optBuf
    case .pcmFormatInt16:
        guard var dst = optBuf.int16ChannelData?[0] else { return nil }
        for buf in iptBufs {
            guard let src = buf.int16ChannelData?[0] else { return nil }
            dst.update(from: src, count: Int(buf.frameLength))
            dst += Int(buf.frameLength)
        }
        optBuf.frameLength = len
        return optBuf
    default: return nil
    }
}
