//
//  MQTextFieldViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/2.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import MQKit

class MQTextFieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let txtField = MQTextField(frame: CGRect(x: 0, y: 100, width: 200, height: 50));
        self.view.addSubview(txtField)
        txtField.placeholder = "这个是测试";
        txtField.textDidChang { textField, text in
            print(text)
        }
        txtField.maxTextCount = 4
    }
}
