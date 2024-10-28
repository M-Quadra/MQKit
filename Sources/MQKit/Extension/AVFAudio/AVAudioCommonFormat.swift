//
//  AVAudioCommonFormat.swift
//  MQKit
//
//  Created by m_quadra on 2024/10/28.
//

import AVFAudio

#if DEBUG
extension AVAudioCommonFormat: @retroactive CustomStringConvertible {
    public var description: String { switch self {
    case .otherFormat: "AVAudioCommonFormat.otherFormat"
    case .pcmFormatFloat32: "AVAudioCommonFormat.pcmFormatFloat32"
    case .pcmFormatFloat64: "AVAudioCommonFormat.pcmFormatFloat64"
    case .pcmFormatInt16: "AVAudioCommonFormat.pcmFormatInt16"
    case .pcmFormatInt32: "AVAudioCommonFormat.pcmFormatInt32"
    @unknown default: "AVAudioCommonFormat.\(self.rawValue)"
    }}
}
#endif
