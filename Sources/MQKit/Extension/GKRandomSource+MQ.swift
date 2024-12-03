//
//  GKRandomSource+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2024/12/3.
//

import GameplayKit

public extension GKRandomSource {
    
    consuming func random(_ range: Range<Float>) -> Float {
        return range.lowerBound + (range.upperBound - range.lowerBound) * self.nextUniform()
    }
}
