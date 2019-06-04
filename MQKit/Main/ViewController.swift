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
        
        let ts = UIFont.mq_allFontNames
        print(ts)
        
        let bgColor = UIColor(hexString: "#AABBCC")
        self.view.backgroundColor = bgColor
    }
}

