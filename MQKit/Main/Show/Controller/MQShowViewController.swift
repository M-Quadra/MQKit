//
//  MQShowViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQShowViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let key = String(cString: class_getName(MQShowCell.self))
        self.tableView.register(MQShowCell.self, forCellReuseIdentifier: key)
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = String(cString: class_getName(MQShowCell.self))
        let cell = tableView.dequeueReusableCell(withIdentifier: key, for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "UIFont+MQ"
        case 1:
            cell.textLabel?.text = "UIColor+MQ"
        case 2:
            cell.textLabel?.text = "URL+MQ"
        case 3:
            cell.textLabel?.text = "Date+MQ"
        case 4:
            cell.textLabel?.text = "String+MQ"
        case 5:
            cell.textLabel?.text = "UIImage+MQ"
        case 6:
            cell.textLabel?.text = "MQHorizontalPagingView"
        default:
            cell.textLabel?.text = "------"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let fontVC = MQFontViewController()
            self.navigationController?.pushViewController(fontVC, animated: true)
        case 1:
            let colorVC = MQColorViewController()
            self.navigationController?.pushViewController(colorVC, animated: true)
        case 2:
            let URLVC = MQURLViewController()
            self.navigationController?.pushViewController(URLVC, animated: true)
        case 3:
            let dateVC = MQDateViewController()
            self.navigationController?.pushViewController(dateVC, animated: true)
        case 4:
            let strVC = MQStringViewController()
            self.navigationController?.pushViewController(strVC, animated: true)
        case 5:
            let imgVC = MQUIImageViewController()
            self.navigationController?.pushViewController(imgVC, animated: true)
        case 6:
            let sliderVC = MQHorizontalPagingViewController()
            self.navigationController?.pushViewController(sliderVC, animated: true)
        default: break
        }
    }
}
