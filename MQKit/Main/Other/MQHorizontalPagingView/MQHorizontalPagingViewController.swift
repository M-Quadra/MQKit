//
//  MQHorizontalPagingViewController.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import MQKit

class MQHorizontalPagingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let gapX:CGFloat    = 30
        let gapCell:CGFloat = 10
        
        let rct = CGRect(x: 0, y: 200, width: self.view.mq_width, height: 50)
        let pgView = MQHorizontalPagingView(
            frame: rct,
            info: .init(edgeSpacing: gapX, cellSpacing: gapCell, cellWidth: self.view.mq_width - gapX*2, pageWidth: self.view.mq_width - gapX*2 + gapCell))
        pgView.backgroundColor = .red
        self.view.addSubview(pgView)
        
        
        pgView.dequeueCell { (idxPath) -> MQHorizontalPagingView.Cell<tsCell> in
            return .willDisplay({ (cell) in
                cell.backgroundColor = .blue
            })
        }
        
        pgView.didSelectCell { (cltV, item) in
            print("didSelectCell", item)
        }
        
        pgView.cellCount = 3
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
//            pgView.cellCount = 10
//        }
    }
    
}

fileprivate class tsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        btn.backgroundColor = .yellow
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func click() {
        print("btn clc")
    }
}
