//
//  DetailsViewController.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var user: User?
    
    //    MARK: - UI Elements
    //    User
    private let userId: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let usersName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userEmail: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userPhone: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userWebsite: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var userStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userId, usersName, userName, userEmail, userPhone, userWebsite])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    //    Address
    private let userStreet: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userSuite: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userCity: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userZipCode: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userLat: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userLng: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var addressStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userStreet, userSuite, userCity, userZipCode, userLat, userLng])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    //    Company
    private let userCompanyName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userCompanyCatchPhrase: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let userCompanyBS: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var companyStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userCompanyName, userCompanyCatchPhrase, userCompanyBS])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    
    //  MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
extension DetailsViewController {
    
    //  MARK: - Private Functions
    
    private func setup() {
        addSubView()
        setInformation()
        setupConstrains()
    }
    
    private func addSubView() {
        view.addSubview(userStack)
        view.addSubview(addressStack)
        view.addSubview(companyStack)
    }
    
    private func setInformation() {
        userId.text = "User ID: \(String(describing: user?.id))"
        usersName.text = "User Name: \(String(describing: user?.name))"
        userName.text = "User UserName: \(String(describing: user?.username))"
        userEmail.text = "User Email: \(String(describing: user?.email))"
        userPhone.text = "User Phone Number: \(String(describing: user?.phone))"
        userWebsite.text = "Users WebSite: \(String(describing: user?.website))"
        
        userStreet.text = "Users Street: \(String(describing: user?.address.street))"
        userSuite.text = "Users Suite: \(String(describing: user?.address.suite))"
        userCity.text = "Users City: \(String(describing: user?.address.city))"
        userCity.text = "Users ZipCode: \(String(describing: user?.address.zipcode))"
        userLat.text = "Users Latitude: \(String(describing: user?.address.geo.lat))"
        userLng.text = "Users Longitude: \(String(describing: user?.address.geo.lng))"
        
        userCompanyName.text = "Users Company Name: \(String(describing: user?.company.name))"
        userCompanyCatchPhrase.text = "Users Company Catch Phrase: \(String(describing: user?.company.catchPhrase))"
        userCompanyBS.text = "Users BS \(String(describing: user?.company.bs))"
    }
    
    private func setupConstrains() {
        userStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        addressStack.snp.makeConstraints { make in
            make.top.equalTo(userStack.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        companyStack.snp.makeConstraints { make in
            make.top.equalTo(addressStack.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(15)
        }
    }
    
    
}


