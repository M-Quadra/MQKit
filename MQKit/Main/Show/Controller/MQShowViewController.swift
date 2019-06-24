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
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let fontVC = MQFontViewController()
            self.navigationController?.pushViewController(fontVC, animated: true)
        default: break
        }
    }
}
