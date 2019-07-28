//
//  StringEncoding+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/29.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String.Encoding {
    
    init(_ mq_cfStringEncoding: CFStringEncodings) {
        let rawValue = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(mq_cfStringEncoding.rawValue))
        self.init(rawValue: rawValue)
    }
    
    static var mq_allValues: [String.Encoding] {
        return [
            .ascii,
            .nextstep,
            .japaneseEUC,
            .utf8,
            .isoLatin1,
            .symbol,
            .nonLossyASCII,
            .shiftJIS,
            .isoLatin2,
            .unicode,
            .windowsCP1251,
            .windowsCP1252,
            .windowsCP1253,
            .windowsCP1254,
            .windowsCP1250,
            .iso2022JP,
            .macOSRoman,
            .utf16,
            .utf16BigEndian,
            .utf16LittleEndian,
            .utf32,
            .utf32BigEndian,
            .utf32LittleEndian,
        ]
    }
}
