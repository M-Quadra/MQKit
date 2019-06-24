//
//  MQShowCell.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/25.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

class MQShowCell: UITableViewCell {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
    }

}
