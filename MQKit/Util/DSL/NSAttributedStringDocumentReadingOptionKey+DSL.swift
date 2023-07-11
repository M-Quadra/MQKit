//
//  NSAttributedStringDocumentReadingOptionKey+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2023/1/29.
//  Copyright © 2023 M_noAria. All rights reserved.
//

import UIKit

public extension DictionaryDSL where Key == NSAttributedString.DocumentReadingOptionKey, Value == Any {

    @discardableResult
    func documentType(_ type: NSAttributedString.DocumentType) -> Self {
        self.dic[.documentType] = type
        return self
    }

    @discardableResult
    func defaultAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.dic[.defaultAttributes] = attributes
        return self
    }

    @discardableResult
    func characterEncoding(_ encoding: String.Encoding) -> Self {
        self.dic[.characterEncoding] = encoding.rawValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func targetTextScaling(_ scaling: CGFloat) -> Self {
        self.dic[.targetTextScaling] = scaling
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func sourceTextScaling(_ scaling: CGFloat) -> Self {
        self.dic[.sourceTextScaling] = scaling
        return self
    }
}
