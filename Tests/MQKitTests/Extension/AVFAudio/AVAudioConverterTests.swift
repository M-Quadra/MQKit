//
//  AVAudioConverterTests.swift
//
//
//  Created by m_quadra on 2024/4/12.
//

import XCTest
import AVFAudio
@testable import MQKit

final class AVAudioConverterTests: XCTestCase {
    
    fileprivate let synthesizer = AVSpeechSynthesizer()
    fileprivate var converter: AVAudioConverter?
    
    func testConvert() async throws {
        DispatchQueue.concurrentPerform(iterations: 11) { _ in
            let utterance = AVSpeechUtterance(string: "嗯，哼哼，啊啊啊啊啊！")
            self.synthesizer.write(consume utterance) { [weak self] buffer in
                guard let self = self,
                      let iptBuf = buffer as? AVAudioPCMBuffer
                else { return }
                
                Task {
                    let optBuf = try! await self.convert(iptBuf)
                    print(iptBuf.frameLength, "->", optBuf.frameLength)
                }
            }
        }
        try await Task.sleep(nanoseconds: 5 * NSEC_PER_SEC)
    }
    
    fileprivate func convert(_ buffer: AVAudioPCMBuffer) async throws -> AVAudioPCMBuffer {
        let iptFmt = buffer.format
        
        if self.converter == nil,
           let optFmt = AVAudioFormat(commonFormat: .pcmFormatFloat64, sampleRate: 114514, channels: 2, interleaved: false) {
            self.converter = AVAudioConverter(from: consume iptFmt, to: optFmt)
            print("create converter")
        } else if let converter = self.converter,
                  converter.inputFormat != iptFmt,
                  let optFmt = AVAudioFormat(commonFormat: .pcmFormatFloat64, sampleRate: 114514, channels: 2, interleaved: false) {
            self.converter = AVAudioConverter(from: buffer.format, to: optFmt)
        }
        guard let converter = self.converter else { throw Errors.msg("empty convert") }
        
        return try await converter.convert(buffer)
    }
}
