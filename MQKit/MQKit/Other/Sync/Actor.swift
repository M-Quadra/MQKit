//
//  Actor.swift
//  MQKit
//
//  Created by m_quadra on 2023/2/5.
//  Copyright © 2023 M_noAria. All rights reserved.
//

import Foundation

@available(iOS 13.0.0, *)
@globalActor
public actor NoMainActor {
    public static let shared = NoMainActor()
}
