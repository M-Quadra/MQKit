//
//  AVAudioConverterTests.swift
//
//
//  Created by m_quadra on 2024/4/12.
//

import Testing
import AVFAudio
@testable import MQKit

struct AVAudioConverterTests {
    
    fileprivate let synthesizer = AVSpeechSynthesizer()
    fileprivate var converter: AVAudioConverter?
    
    @Test mutating func testConvert() async throws {
        let utterance = AVSpeechUtterance(string: "嗯，哼哼，啊啊啊啊啊！")
        guard let iptBuf = await self.synthesizer.generateBuffer(utterance) else { return }
        #expect(iptBuf.frameLength == 46080)
        
        let optBuf = try! await self.convert(iptBuf)
        #expect(optBuf.frameLength == 239310)
    }
    
    fileprivate mutating func convert(_ buffer: AVAudioPCMBuffer) async throws -> AVAudioPCMBuffer {
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
        
        return try converter.convert(buffer)
    }
}
