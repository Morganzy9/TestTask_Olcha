//
//  MainViewController + PostManagerDelegate.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import Foundation

extension MainViewController: PostManagerDelegate {
    
    func didFetchPost(_ manager: PostManager, _ post: [Post]) {
        self.posts = post
        
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
