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
        
//        let ts = UIFont.mq_allFontNames
//        print(ts)
//
//        let bgColor = UIColor(hexString: "#AABBCC")
//        self.view.backgroundColor = bgColor
        
        let txt = "🤩😏😜"
        print(txt)
        print(NSString(string: txt).length, txt.count)
        
        print(FileManager.mq_cachesPath, "\n", FileManager.mq_cachesURL)
    }
}


