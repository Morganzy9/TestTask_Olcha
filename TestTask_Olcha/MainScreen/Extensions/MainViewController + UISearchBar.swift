//
//  MainViewController + UISearchBar.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/11/23.
//

import UIKit

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredPosts = []
            postsTableView.reloadData()
        } else {
            isSearching = true
            filteredPosts = posts.filter { $0.title.lowercased().contains(searchText.lowercased()) }
            postsTableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        filteredPosts = []
        postsTableView.reloadData()
    }
}
