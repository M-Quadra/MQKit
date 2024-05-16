//
//  AVSpeechSynthesizerTests.swift
//
//
//  Created by m_quadra on 2024/5/16.
//

import XCTest
import AVFAudio
import MQKit

final class AVSpeechSynthesizerTests: XCTestCase {
    
    fileprivate let synthesizer = AVSpeechSynthesizer()
    
    func testGenerateBuffer() async {
        let utt = AVSpeechUtterance(string: "这是一个一个一个音频流")
        guard let buf = await self.synthesizer.generateBuffer(utt) else {
            return XCTFail("generateBuffer failed")
        }
        XCTAssertEqual(buf.frameLength, 45568)
    }
}
