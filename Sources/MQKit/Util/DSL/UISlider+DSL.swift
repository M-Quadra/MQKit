//
//  UISlider+DSL.swift
//
//
//  Created by m_quadra on 2024/4/8.
//

import UIKit

public extension UIViewDSL where T: UISlider {
    
    @discardableResult
    func value(_ value: consuming Float) -> Self {
        self.object.value = value
        return self
    }
    
    @discardableResult
    func minimumValue(_ minimumValue: consuming Float) -> Self {
        self.object.minimumValue = minimumValue
        return self
    }
    
    @discardableResult
    func maximumValue(_ maximumValue: consuming Float) -> Self {
        self.object.maximumValue = maximumValue
        return self
    }
    
    @discardableResult
    func setValue(_ value: Float, range: ClosedRange<Float>) -> Self {
        self.object.minimumValue = range.lowerBound
        self.object.maximumValue = range.upperBound
        self.object.value = value
        return self
    }
    
    @discardableResult
    func minimumValueImage(_ minimumValueImage: consuming UIImage?) -> Self {
        self.object.minimumValueImage = minimumValueImage
        return self
    }
    
    @discardableResult
    func maximumValueImage(_ maximumValueImage: consuming UIImage?) -> Self {
        self.object.maximumValueImage = maximumValueImage
        return self
    }
    
    @discardableResult
    func isContinuous(_ isContinuous: consuming Bool) -> Self {
        self.object.isContinuous = isContinuous
        return self
    }
    
    @discardableResult
    func minimumTrackTintColor(_ minimumTrackTintColor: consuming UIColor?) -> Self {
        self.object.minimumTrackTintColor = minimumTrackTintColor
        return self
    }
    
    @discardableResult
    func maximumTrackTintColor(_ maximumTrackTintColor: consuming UIColor?) -> Self {
        self.object.maximumTrackTintColor = maximumTrackTintColor
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ thumbTintColor: consuming UIColor?) -> Self {
        self.object.thumbTintColor = thumbTintColor
        return self
    }
    
    @discardableResult
    func setThumbImage(_ thumbImage: consuming UIImage?, for state: consuming UIControl.State) -> Self {
        self.object.setThumbImage(thumbImage, for: state)
        return self
    }
    
    @discardableResult
    func setMinimumTrackImage(_ minimumTrackImage: consuming UIImage?, for state: consuming UIControl.State) -> Self {
        self.object.setMinimumTrackImage(minimumTrackImage, for: state)
        return self
    }
    
    @discardableResult
    func setMaximumTrackImage(_ maximumTrackImage: consuming UIImage?, for state: consuming UIControl.State) -> Self {
        self.object.setMaximumTrackImage(maximumTrackImage, for: state)
        return self
    }
    
    @discardableResult
    func addTarget(_ target: consuming Any?, action: consuming Selector, for controlEvents: consuming UIControl.Event = .valueChanged) -> Self {
        self.object.addTarget(target, action: action, for: controlEvents)
        return self
    }
}
