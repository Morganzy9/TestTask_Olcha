//
//  SavedViewController.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import UIKit

class SavedViewController: UITabBarController {

    //    MARK: - UI Elements
    
    let savedTableView: UITableView = {
        return UITableView()
    }()
    
    //    MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        savedTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension SavedViewController {
    
    private func setup() {
        setNavigationController()
        addSubView()
        setDelegates()
        registerCells()
        setupConstrains()
    }
    
    private func addSubView() {
        view.addSubview(savedTableView)
    }
    
    
    private func setNavigationController() {
        title = "Saved Posts"
        navigationController?.navigationBar.tintColor = .red
    }
    
    private func setDelegates() {
        savedTableView.delegate = self
        savedTableView.dataSource = self
    }
    
    private func registerCells() {
        savedTableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.reuseIdentifier)
    }
    
    private func setupConstrains() {
        savedTableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
