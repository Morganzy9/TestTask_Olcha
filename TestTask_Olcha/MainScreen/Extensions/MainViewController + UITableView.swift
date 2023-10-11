//
//  MainViewController + UITableView.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/8/23.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredPosts.count : users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let postCell = postsTableView.dequeueReusableCell(withIdentifier: PostsCell.reuseIdentifier, for: indexPath) as? PostsCell else {
            fatalError("Can not dequeue PostsCell")
        }

        let currentUser = users[indexPath.row]
        let currentPost = isSearching ? filteredPosts[indexPath.row] : posts[indexPath.row]

        postCell.configureCell(authorName: currentUser.name, postsTitle: currentPost.title)

        return postCell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = DetailsViewController()
        destinationVC.user = users[indexPath.row]
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let save = UIContextualAction(style: .normal, title: "Save") {  _, view, completion in
            SavedPostsManager.shared.addUserAndPost(self.users[indexPath.row], self.posts[indexPath.row])
            completion(true)
        }

        save.image = UIImage(systemName: "bookmark")
        save.backgroundColor = UIColor.green

        let swipeActions = UISwipeActionsConfiguration(actions: [save])
        return swipeActions
    }

    
}
