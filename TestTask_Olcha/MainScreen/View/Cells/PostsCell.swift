//
//  PostsCell.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/9/23.
//

import UIKit
import SnapKit

class PostsCell: UITableViewCell {
    
    static let reuseIdentifier = "UITableViewPostsCell"
    
    //  MARK: - UI Elements
    
    private let authrorNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let postsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    
    //  MARK: - Private Functions
    
    func configureCell(authorName: String, postsTitle: String) {
        authrorNameLabel.text = "Author: \(authorName)"
        postsTitleLabel.text = "Post: \(postsTitle)"
        setup()
    }
    
    private func setup() {
        addCellSubViews()
        setConstrains()
    }
    
    private func addCellSubViews() {
        addSubview(postsTitleLabel)
        addSubview(authrorNameLabel)
    }
    
    private func setConstrains() {
        authrorNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
        }
        postsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(authrorNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-10)
        }
    }
}
