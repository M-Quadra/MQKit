//
//  StringListViewController.swift
//  Demo
//
//  Created by m_quadra on 2023/4/19.
//

import UIKit
import MQKit
import SnapKit

class StringListViewController: UIViewController {

    fileprivate let layout: UICollectionViewCompositionalLayout = .sectionProvider { idx, env in
        let item = NSCollectionLayoutItem(layoutSize: .fill)
        
        let group: NSCollectionLayoutGroup = .vertical(
            layoutSize: .height(.absolute(40)),
            subitems: [item]
        )
        
        let section = group.section
        section.interGroupSpacing = 1
        return section
    }
    lazy var collectionView = dsl(for: UICollectionView(layout: self.layout)) { make in
        make.backgroundColor(.clear)
            .register(cells: [
                TextCell.self,
            ])
    }
    lazy var datasource = UICollectionViewDiffableDataSource<Int, String>(collectionView: self.collectionView) { collectionView, indexPath, itemIdentifier in
        let cell: TextCell = collectionView.dequeue(for: indexPath)
        cell.textLabel.text = itemIdentifier
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        self.view.addSubviews([
            self.collectionView,
        ])
        
        self.collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
