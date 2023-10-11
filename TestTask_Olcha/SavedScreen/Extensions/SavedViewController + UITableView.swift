//
//  SavedViewController + UITableView.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/11/23.
//

import UIKit

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedPostsManager.shared.savedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = savedTableView.dequeueReusableCell(withIdentifier: PostsCell.reuseIdentifier, for: indexPath) as? PostsCell else {
            fatalError("Can not dequeue PostsCell in SavedTableView")
        }
        
        let currentUser = SavedPostsManager.shared.savedUsers[indexPath.row]
        let currentPost = SavedPostsManager.shared.savedPosts[indexPath.row]
        
        cell.configureCell(authorName: currentUser.name, postsTitle: currentPost.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
