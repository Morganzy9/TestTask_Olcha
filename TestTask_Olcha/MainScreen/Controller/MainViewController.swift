//
//  MainViewController.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/8/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    //  MARK: - Constants
    
    var postManager = PostManager()
    
    var posts: [Post] = []
    var users: [User] = []
    var filteredPosts: [Post] = []
    var isSearching: Bool = false

    
    //  MARK: - UI Elements
    private let postsSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Post..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(refreshData.self, action: #selector(refreshData), for: .valueChanged)
        return refresh
    }()
    
    let postsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //  MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        postManager.fetchPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
}

extension MainViewController {
    
    //  MARK: - Private Functions
    
    private func setup() {
        setNavigationController()
        addSubView()
        setDelegates()
        registerCells()
        setupConstrains()
        postsTableView.refreshControl = refreshControl
    }
    
    private func addSubView() {
        view.addSubview(postsSearchBar)
        view.addSubview(postsTableView)
    }
    
    private func setNavigationController() {
        title = "Posts"
    }
    
    private func setDelegates() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postManager.delegate = self
        postsSearchBar.delegate = self
    }
    
    private func registerCells() {
        postsTableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.reuseIdentifier)
    }
    
    private func setupConstrains() {
        postsSearchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        
        postsTableView.snp.makeConstraints { make in
            make.top.equalTo(postsSearchBar.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //  MARK: - private @objc function
    
    @objc private func refreshData() {
        postManager.fetchPosts()
        
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
}

