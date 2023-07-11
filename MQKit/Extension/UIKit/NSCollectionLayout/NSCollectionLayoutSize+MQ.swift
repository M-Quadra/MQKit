//
//  NSCollectionLayoutSize+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension NSCollectionLayoutSize {
    
    static var zero: Self {
        return Self.init(
            widthDimension: .absolute(0),
            heightDimension: .absolute(0)
        )
    }
    
    static var fill: Self {
        return Self.init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
    }
    
    static func width(_ width: NSCollectionLayoutDimension) -> Self {
        return Self.init(
            widthDimension: width,
            heightDimension: .fractionalHeight(1)
        )
    }
    
    static func height(_ height: NSCollectionLayoutDimension) -> Self {
        return Self.init(
            widthDimension: .fractionalWidth(1),
            heightDimension: height
        )
    }
}
