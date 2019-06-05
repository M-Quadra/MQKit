//
//  String+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/6.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String {
    public static let mq_documents = URL.mq_documents.path
    public static let mq_caches    = URL.mq_caches.path
    public static let mq_library   = URL.mq_library.path
    public static let mq_tmp       = NSTemporaryDirectory()
}
