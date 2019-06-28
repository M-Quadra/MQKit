//
//  MQURLViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/28.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQURLViewController: UITableViewController {
    
    let key = String(cString: class_getName(UITableViewCell.self))

    let titleAry = [
        "[URL.mq_documents] " + URL.mq_documents.absoluteString,
        "[URL.mq_caches] "    + URL.mq_caches.absoluteString,
        "[URL.mq_library] "   + URL.mq_library.absoluteString,
        "[URL.mq_tmp] "       + URL.mq_tmp.absoluteString,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
