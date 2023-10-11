//
//  CustomTabBarController.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        tabBar.tintColor = .red
        tabBar.backgroundColor = Colors.darkWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)

        let mainVC = MainViewController()
        let savedVC = SavedViewController()

        mainVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "star"), selectedImage: nil)
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark"), selectedImage: nil)

        let mainNC = UINavigationController(rootViewController: mainVC)
        let savedNC = UINavigationController(rootViewController: savedVC)

        let tabBarList = [mainNC, savedNC]

        viewControllers = tabBarList
    }

}
