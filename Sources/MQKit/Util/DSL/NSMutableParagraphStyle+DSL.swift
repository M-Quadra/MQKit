//
//  NSMutableParagraphStyle+DSL.swift
//
//
//  Created by m_quadra on 2024/5/30.
//

import UIKit

public struct NSMutableParagraphStyleDSL<T: NSMutableParagraphStyle> {
    public let object: T
    init(_ object: T) {
        self.object = object
    }
}

@discardableResult
public func dsl<T: NSMutableParagraphStyle>(
    for style: T = T(),
    closure: (_ make: NSMutableParagraphStyleDSL<T>) -> Void
) -> T {
    closure(NSMutableParagraphStyleDSL(style))
    return style
}

public extension NSMutableParagraphStyleDSL {
    
    @discardableResult
    consuming func lineSpacing(_ lineSpacing: CGFloat) -> Self {
        self.object.lineSpacing = lineSpacing
        return self
    }
    
    @discardableResult
    consuming func paragraphSpacing(_ paragraphSpacing: CGFloat) -> Self {
        self.object.paragraphSpacing = paragraphSpacing
        return self
    }
    
    @discardableResult
    consuming func alignment(_ alignment: NSTextAlignment) -> Self {
        self.object.alignment = alignment
        return self
    }
    
    @discardableResult
    consuming func firstLineHeadIndent(_ firstLineHeadIndent: CGFloat) -> Self {
        self.object.firstLineHeadIndent = firstLineHeadIndent
        return self
    }
    
    @discardableResult
    consuming func headIndent(_ headIndent: CGFloat) -> Self {
        self.object.headIndent = headIndent
        return self
    }
    
    @discardableResult
    consuming func tailIndent(_ tailIndent: CGFloat) -> Self {
        self.object.tailIndent = tailIndent
        return self
    }
    
    @discardableResult
    consuming func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.object.lineBreakMode = lineBreakMode
        return self
    }
    
    @discardableResult
    consuming func minimumLineHeight(_ minimumLineHeight: CGFloat) -> Self {
        self.object.minimumLineHeight = minimumLineHeight
        return self
    }
    
    @discardableResult
    consuming func maximumLineHeight(_ maximumLineHeight: CGFloat) -> Self {
        self.object.maximumLineHeight = maximumLineHeight
        return self
    }
    
    @discardableResult
    consuming func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> Self {
        self.object.baseWritingDirection = baseWritingDirection
        return self
    }
    
    @discardableResult
    consuming func lineHeightMultiple(_ lineHeightMultiple: CGFloat) -> Self {
        self.object.lineHeightMultiple = lineHeightMultiple
        return self
    }
    
    @discardableResult
    consuming func paragraphSpacingBefore(_ paragraphSpacingBefore: CGFloat) -> Self {
        self.object.paragraphSpacingBefore = paragraphSpacingBefore
        return self
    }
    
    @discardableResult
    consuming func hyphenationFactor(_ hyphenationFactor: Float) -> Self {
        self.object.hyphenationFactor = hyphenationFactor
        return self
    }
    
    @discardableResult @available(iOS 15.0, *)
    consuming func usesDefaultHyphenation(_ usesDefaultHyphenation: Bool) -> Self {
        self.object.usesDefaultHyphenation = usesDefaultHyphenation
        return self
    }
    
    @discardableResult
    consuming func tabStops(_ tabStops: [NSTextTab]) -> Self {
        self.object.tabStops = tabStops
        return self
    }
    
    @discardableResult
    consuming func defaultTabInterval(_ defaultTabInterval: CGFloat) -> Self {
        self.object.defaultTabInterval = defaultTabInterval
        return self
    }
    
    @discardableResult
    consuming func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self {
        self.object.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    
    @discardableResult
    consuming func lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self {
        self.object.lineBreakStrategy = lineBreakStrategy
        return self
    }
    
    @discardableResult
    consuming func textLists(_ textLists: [NSTextList]) -> Self {
        self.object.textLists = textLists
        return self
    }
    
    @discardableResult
    consuming func addTabStop(_ tabStop: NSTextTab) -> Self {
        self.object.addTabStop(tabStop)
        return self
    }
    
    @discardableResult
    consuming func removeTabStop(_ tabStop: NSTextTab) -> Self {
        self.object.removeTabStop(tabStop)
        return self
    }
    
    @discardableResult
    consuming func setParagraphStyle(_ paragraphStyle: NSParagraphStyle) -> Self {
        self.object.setParagraphStyle(paragraphStyle)
        return self
    }
}
