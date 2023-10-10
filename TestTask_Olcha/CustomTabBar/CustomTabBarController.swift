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
        
        removeTabbarItemsText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)

        let mainVC = MainViewController()
        let savedVC = SavedViewController()

        mainVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "heart"), selectedImage: nil)
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "heart"), selectedImage: nil)

        let mainNC = UINavigationController(rootViewController: mainVC)
        let savedNC = UINavigationController(rootViewController: savedVC)

        let tabBarList = [mainNC, savedNC]

        viewControllers = tabBarList
    }

    
    func removeTabbarItemsText() {
       if let items = tabBarController?.tabBar.items {
          for item in items {
             item.title = ""
              item.imageInsets = UIEdgeInsets(top: 6,
                                              left: 0,
                                              bottom: -6,
                                              right: 0)
          }
       }
    }
}
