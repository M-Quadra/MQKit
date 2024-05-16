//
//  FontExtensionViewController.swift
//  Demo
//
//  Created by m_quadra on 2023/4/19.
//

import UIKit
import MQKit

class FontExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "UIFont+MQ"
        
        _ = UIFont.allFontNames
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}
