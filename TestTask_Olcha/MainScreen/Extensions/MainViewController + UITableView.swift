//
//  MainViewController + UITableView.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/8/23.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let postCell = postsTableView.dequeueReusableCell(withIdentifier: PostsCell.reuseIdentifier, for: indexPath) as? PostsCell else {
            fatalError("Can not dequeue PostsCell")
        }
        var data: [PostModel] = []
        
        for _ in 1...11 {
            data.append(PostModel(authorName: "Ola", postsTitle: "Akfjnsekfjns fjksnefkjesn"))
            print(data.count)
        }
        
        postCell.cellData = data[indexPath.row]
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
