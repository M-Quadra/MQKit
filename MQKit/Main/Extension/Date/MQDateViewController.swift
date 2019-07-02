//
//  MQDateViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/1.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQDateViewController: UITableViewController {

    let key = String(cString: class_getName(UITableViewCell.self))
    var titleAry: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nowDate = Date()
        
        titleAry = [
            "year: "   + String(format: "%d", nowDate.mq_year),
            "month: "  + String(format: "%d", nowDate.mq_month),
            "day: "    + String(format: "%d", nowDate.mq_day),
            "hour: "   + String(format: "%d", nowDate.mq_hour),
            "minute: " + String(format: "%d", nowDate.mq_minute),
            "second: " + String(format: "%d", nowDate.mq_second),
        ]

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: key)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleAry.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: key, for: indexPath)
        cell.textLabel?.text = titleAry[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }

}
