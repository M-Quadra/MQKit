//
//  ExtensionHomeViewController.swift
//  Demo
//
//  Created by m_quadra on 2023/2/23.
//

import UIKit
import MQKit

class ExtensionHomeViewController: StringListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.collectionView.delegate = self
        
        var snapshot = self.datasource.emptySnapshot
        snapshot.appendSections([0])
        snapshot.appendItems([
            "UIFont+MQ",
        ])
        self.datasource.apply(snapshot)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - UICollectionView Delegate
extension ExtensionHomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = self.datasource.itemIdentifier(for: indexPath) else { return }
        switch item {
        case "UIFont+MQ":
            let vc = FontExtensionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
        }
    }
}
