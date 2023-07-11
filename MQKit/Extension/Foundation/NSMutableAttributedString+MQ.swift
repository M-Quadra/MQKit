//
//  NSMutableAttributedString+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2023/1/2.
//  Copyright © 2023 M_noAria. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString {
    
    func append(_ attachment: NSTextAttachment) {
        let attStr = NSAttributedString(attachment: attachment)
        self.append(attStr)
    }
}
