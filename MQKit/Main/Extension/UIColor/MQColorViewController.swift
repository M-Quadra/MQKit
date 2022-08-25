//
//  MQColorViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/28.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQColorViewController: UITableViewController {

    let key = String(cString: class_getName(UITableViewCell.self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: key)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: key, for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "UIColor.mq_random"
            cell.backgroundColor = .random
        case 1:
            cell.textLabel?.text = """
            UIColor.hex("#112233", alpha: 0.5)
            """
            cell.backgroundColor = .hex("#112233", alpha: 0.5)
        case 2:
            cell.textLabel?.text = "UIColor.red.inverse"
            cell.textLabel?.textColor = .red
            cell.backgroundColor = .red.inverse
        default: break
        }
        return cell
    }
}
