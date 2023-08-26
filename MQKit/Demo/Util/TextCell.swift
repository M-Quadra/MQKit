//
//  TextCell.swift
//  Demo
//
//  Created by m_quadra on 2023/4/19.
//

import UIKit
import MQKit

class TextCell: UICollectionViewCell {
    required init?(coder: NSCoder) { return nil }
    
    let textLabel: UILabel = dsl { make in
        make.textColor(.black)
            .font(.systemFont(ofSize: 16))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .gray
        
        self.contentView.addSubviews([
            self.textLabel,
        ])
        
        self.textLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
}
