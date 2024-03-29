//
//  CFStringEncodings+MQCode.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/29.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

public extension CFStringEncodings {
    
    var stringEncoding: String.Encoding {
        return String.Encoding(self)
    }
}

extension String {
    
    init?(data: Data, mq_encoding: CFStringEncodings) {
        self.init(data: data, mq_encoding: String.Encoding(mq_encoding))
    }
    
    init?(data: Data, mq_encoding: String.Encoding) {
        self.init(data: data, encoding: mq_encoding)
    }
}
