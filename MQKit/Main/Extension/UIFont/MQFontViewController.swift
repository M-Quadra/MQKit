//
//  MQFontViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQFontViewController: UITableViewController {

    let fontNameAry = UIFont.mq_allFontNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let key = String(cString: class_getName(UITableViewCell.self))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: key)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fontNameAry.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = String(cString: class_getName(UITableViewCell.self))
        let cell = tableView.dequeueReusableCell(withIdentifier: key, for: indexPath)
        cell.selectionStyle = .none
        
        let fontName = fontNameAry[indexPath.section]
        cell.textLabel?.font = UIFont(name: fontName, size: 24)
        cell.textLabel?.numberOfLines = 0
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = fontName
        case 1:
            cell.textLabel?.text = "0123456789"
        case 2:
            cell.textLabel?.text = """
            ABCDEFG HIJKLMN
            OPQ RST UVW XYZ
            abcdefg hijklmn
            opq rst uvw xyz
            """
        case 3:
            cell.textLabel?.text = """
            汉体书写信息技术标准相容
            档案下载使用界面简单
            支援服务升级资讯专业制作
            创意空间快速无线上网
            ㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩
            AaBbCc ＡａＢｂＣｃ
            """
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
}
