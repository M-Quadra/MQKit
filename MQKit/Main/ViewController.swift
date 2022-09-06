//
//  ViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/4.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .random
        
        let txt = "🤩😏😜"
        print(txt)
        print(NSString(string: txt).length, txt.count)
        
        let tsView = UIView(frame: CGRect(x: 0, y: 80, width: 50, height: 50))
        tsView.backgroundColor = .random
        self.view.addSubview(tsView)
        tsView.mq_left = 100
        
        let radian = Double.radian(angle: 45)
        
        print(tan(radian))
    }
}


