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
    
    //  MARK: - UI Elements
    
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
    }
    
    private func addSubView() {
        view.addSubview(postsTableView)
    }
    
    
    private func setNavigationController() {
        title = "Posts"
    }
    
    private func setDelegates() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postManager.delegate = self
    }
    
    private func registerCells() {
        postsTableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.reuseIdentifier)
    }
    
    private func setupConstrains() {
        postsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

