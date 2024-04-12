//
//  Errors.swift
//  
//
//  Created by m_quadra on 2024/4/7.
//

import Foundation

enum Errors: Error {
    case timeout
    case msg(_: String = "", file: StaticString = #fileID, line: UInt = #line)
    case todo(_: String = "", file: StaticString = #fileID, line: UInt = #line)
}
