//
//  SceneDelegate+UI.swift
//  Demo
//
//  Created by m_quadra on 2023/2/21.
//

import UIKit

extension SceneDelegate {
    
    func setupUI() {
        let tabBarCtrl = UITabBarController()
        tabBarCtrl.tabBar.backgroundColor = .white
        let navCtrl = UINavigationController(rootViewController: tabBarCtrl)
        self.window?.rootViewController = navCtrl
        
        let extensionHomeVC = ExtensionHomeViewController()
        extensionHomeVC.tabBarItem.title = "Extension"
        extensionHomeVC.tabBarItem.image = UIImage(systemName: "doc.on.doc")
        
        let utilHomeVC = UtilHomeViewController()
        utilHomeVC.tabBarItem.title = "Util"
        utilHomeVC.tabBarItem.image = UIImage(systemName: "tray")
        
        let componentHomeVC = ComponentHomeViewController()
        componentHomeVC.tabBarItem.title = "Component"
        componentHomeVC.tabBarItem.image = UIImage(systemName: "circle.grid.3x3")
        
        tabBarCtrl.viewControllers = [
            extensionHomeVC,
            utilHomeVC,
            componentHomeVC,
        ]
    }
}
