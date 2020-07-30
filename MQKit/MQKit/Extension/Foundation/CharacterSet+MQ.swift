//
//  CharacterSet+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2020/7/29.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Foundation

extension CharacterSet {
    
    public func union(mq_in: String) -> Self {
        return self.union(.init(charactersIn: mq_in))
    }
    
    public func subtracting(mq_in: String) -> Self {
        return self.subtracting(.init(charactersIn: mq_in))
    }
    
    public func symmetricDifference(mq_in: String) -> Self {
        return self.symmetricDifference(.init(charactersIn: mq_in))
    }
}
