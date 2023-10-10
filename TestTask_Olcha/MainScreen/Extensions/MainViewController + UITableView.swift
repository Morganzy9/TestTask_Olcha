//
//  MainViewController + UITableView.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/8/23.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let postCell = postsTableView.dequeueReusableCell(withIdentifier: PostsCell.reuseIdentifier, for: indexPath) as? PostsCell else {
            fatalError("Can not dequeue PostsCell")
        }
        let currentCell = posts[indexPath.row]
        
        postCell.configureCell(authorName: currentCell.body, postsTitle: currentCell.title)
        
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}