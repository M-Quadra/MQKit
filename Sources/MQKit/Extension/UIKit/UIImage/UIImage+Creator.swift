//
//  UIImage+Creator.swift
//  MQKit
//
//  Created by m_quadra on 2022/8/25.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIImage {
    
    static func render(
        size: CGSize,
        opaque: Bool = false,
        scale: CGFloat = UITraitCollection.current.displayScale,
        closure: (_ ctx: CGContext) -> ()
    ) -> UIImage {
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale
        format.opaque = false
        let render = UIGraphicsImageRenderer(size: size, format: format)
        return render.image { ctx in
            closure(ctx.cgContext)
        }
    }
    
    static func layer(
        _ layer: CALayer,
        size: CGSize? = nil,
        opaque: Bool = false,
        scale: CGFloat = UITraitCollection.current.displayScale
    ) -> UIImage {
        return Self.render(
            size: size ?? layer.frame.size,
            opaque: opaque,
            scale: scale
        ) { ctx in
            layer.render(in: ctx)
        }
    }
    
    static func color(
        _ color: UIColor,
        size: CGSize = CGSize(1),
        scale: CGFloat = UITraitCollection.current.displayScale
    ) -> UIImage {
        return Self.render(
            size: size,
            opaque: color.getAlpha >= 1.0,
            scale: scale
        ) { ctx in
            ctx.setFillColor(color.cgColor)
            ctx.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    static func dynamic(any: UIImage, dark: UIImage) -> UIImage {
        let anyStyle = UITraitCollection(traitsFrom: [
            UITraitCollection(userInterfaceStyle: .unspecified),
            UITraitCollection(displayScale: any.scale)
        ])
        let darkStyle = UITraitCollection(traitsFrom: [
            UITraitCollection(userInterfaceStyle: .dark),
            UITraitCollection(displayScale: dark.scale)
        ])
        
        let asset = UIImageAsset()
        asset.register(consume any, with: anyStyle)
        asset.register(consume dark, with: consume darkStyle)
        return asset.image(with: consume anyStyle)
    }
}
