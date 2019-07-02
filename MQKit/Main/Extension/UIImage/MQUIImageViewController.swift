//
//  MQUIImageViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/2.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQUIImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIImage(named: "image0")?.mq_averageColor
        
        let imgv = UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        self.view.addSubview(imgv)
        
        let imgSiz = imgv.mq_size
        DispatchQueue.global().async {
            let layer = CAGradientLayer()
            
            layer.colors = [
                UIColor(hexString: "#FFFFFF").cgColor,
                UIColor(hexString: "#000000").cgColor,
            ]
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint   = CGPoint(x: 1, y: 1)
            layer.frame = CGRect(origin: .zero, size: imgSiz)
            
            // alpha判断太麻烦了，交给输入得了
            let img = UIImage(layer: layer, alpha: false)
            
            DispatchQueue.main.async {
                imgv.image = img
            }
        }
    }

}
