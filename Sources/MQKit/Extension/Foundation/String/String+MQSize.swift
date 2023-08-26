//
//  String+MQSize.swift
//  MQKit
//
//  Created by M_Quadra on 2020/3/18.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    public func mq_width(font: UIFont) -> CGFloat {
        let attStr = NSAttributedString.init(string: self, attributes: [.font : font])
        return attStr.size().width
    }
}
