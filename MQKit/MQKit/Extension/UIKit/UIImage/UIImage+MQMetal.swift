//
//  UIImage+MQMetal.swift
//  MQKit
//
//  Created by M_Quadra on 2020/5/8.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func mtlTexture2D(device: MTLDevice) -> MTLTexture? {
        guard let cgImg = self.cgImage else {
            return nil
        }
        
        let pixWidth = cgImg.width
        let pixHeight = cgImg.height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerRow = pixWidth * 4
        
        guard let bitmapContext = CGContext(data: nil,
                                            width: pixWidth, height: pixHeight,
                                            bitsPerComponent: 8,
                                            bytesPerRow: bytesPerRow,
                                            space: colorSpace,
                                            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue) else {
            return nil
        }
        
        bitmapContext.draw(cgImg, in: CGRect(x: 0, y: 0, width: pixWidth, height: pixHeight))
        let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(pixelFormat: .rgba8Unorm, width: pixWidth, height: pixHeight, mipmapped: false)
        
        guard let texture = device.makeTexture(descriptor: textureDescriptor) else {
            return nil
        }
        guard let rawData = bitmapContext.data else {
            return nil
        }
        
        let region = MTLRegionMake2D(0, 0, pixWidth, pixHeight)
        texture.replace(region: region, mipmapLevel: 0, withBytes: rawData, bytesPerRow: bytesPerRow)
        return texture
    }
}
