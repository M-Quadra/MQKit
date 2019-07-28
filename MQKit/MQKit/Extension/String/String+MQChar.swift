//
//  String+MQChar.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/27.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

public typealias MQCharacterSet = Set<Character>
extension MQCharacterSet {
    
    static var naturalNumber: MQCharacterSet {
        return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    }
    
    static var uppercaseLetter: MQCharacterSet {
        return [
            "A", "B", "C", "D", "E", "F", "G",
            "H", "I", "J", "K", "L", "M", "N",
            "O", "P", "Q",      "R", "S", "T",
            "U", "V", "W",      "X", "Y", "Z"
        ]
    }
    
    static var lowercaseLetter: MQCharacterSet {
        return [
            "a", "b", "c", "d", "e", "f", "g",
            "h", "i", "j", "k", "l", "m", "n",
            "o", "p", "q",      "r", "s", "t",
            "u", "v", "w",      "x", "y", "z"
        ]
    }
    
    static var letter: MQCharacterSet {
        return MQCharacterSet.uppercaseLetter.union(MQCharacterSet.lowercaseLetter)
    }
}

extension String {
    
    public func mq_substring(with charSet: MQCharacterSet) -> String {
        return self.filter({ charSet.contains($0) })
    }
}
