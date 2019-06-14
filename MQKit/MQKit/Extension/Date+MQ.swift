//
//  Date+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/14.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension Date {
    public var mq_year:Int {
        return Calendar.current.component(.year, from: self)
    }
    /// [1, 12]
    public var mq_month:Int {
        return Calendar.current.component(.month, from: self)
    }
    /// [1, 31]
    public var mq_day:Int {
        return Calendar.current.component(.day, from: self)
    }
    /// /h
    public var mq_hour:Int {
        return Calendar.current.component(.hour, from: self)
    }
    /// /min
    public var mq_minute:Int {
        return Calendar.current.component(.minute, from: self)
    }
    /// /s
    public var mq_second:Int {
        return Calendar.current.component(.second, from: self)
    }
}
