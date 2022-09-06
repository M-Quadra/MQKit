//
//  MTLTexture+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2020/5/8.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Metal
import UIKit

@available(iOS 9.0, *)
extension MTLTexture {
    
    /// alpha: whether to ues colorAttachments[0].clearColor.alpha
    public func mq_uiImage(alpha: Bool = false) -> UIImage? {
        if self.isFramebufferOnly {
            #if DEBUG
            fatalError("need self.isFramebufferOnly == false")
            #else
            return nil
            #endif
        }
        
        if !alpha {
            return self.mq_uiImageWithCGImage()
        }
        
        return self.mq_uiImageWithCIImage()?.orientation(.downMirrored)
    }
    
    fileprivate func mq_uiImageWithCGImage() -> UIImage? {
        let bytesPerRow = self.width * 4
        var src = [UInt8](repeating: 0, count: bytesPerRow * self.height)

        let region = MTLRegionMake2D(0, 0, self.width, self.height)
        self.getBytes(&src, bytesPerRow: bytesPerRow, from: region, mipmapLevel: 0)
        
        guard let context = CGContext(data: &src,
                                      width: self.width, height: self.height,
                                      bitsPerComponent: 8,
                                      bytesPerRow: bytesPerRow,
                                      space: CGColorSpaceCreateDeviceRGB(),
                                      bitmapInfo: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.noneSkipFirst.rawValue) else {
            return nil
        }
        
        guard let cgImg = context.makeImage() else {
            return nil
        }
        
        return UIImage(cgImage: cgImg, scale: UIScreen.main.scale, orientation: .up)
    }
    
    fileprivate func mq_uiImageWithCIImage() -> UIImage? {
        guard let ciImg = CIImage(mtlTexture: self, options: [CIImageOption.colorSpace: CGColorSpaceCreateDeviceRGB()]) else {
            return nil
        }
        
        return UIImage(ciImage: ciImg, scale: UIScreen.main.scale, orientation: .up)
    }
}
