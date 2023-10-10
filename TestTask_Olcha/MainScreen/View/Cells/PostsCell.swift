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
    
    //  MARK: - Set Cell Data
    
    var cellData: PostModel? {
        didSet {
            self.authrorNameLabel.text = cellData?.authorName
            self.postsTitleLabel.text = cellData?.postsTitle
        }
    }
    
    //  MARK: - UI Elements
    
    private let postsTitleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let authrorNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    //  MARK: - Init Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Private Functions
    
    private func setup() {
        addCellSubViews()
        setConstrains()
    }
    
    private func addCellSubViews() {
        addSubview(postsTitleLabel)
        addSubview(authrorNameLabel)
    }
    
    private func setConstrains() {
        postsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
        }
        
        authrorNameLabel.snp.makeConstraints { make in
            make.top.equalTo(postsTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
        }
    }
}
