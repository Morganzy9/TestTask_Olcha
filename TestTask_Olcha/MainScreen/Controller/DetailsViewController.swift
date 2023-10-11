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
    private let userTitle: UILabel = {
        let label = UILabel()
        label.text = "User Information"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let userId: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let usersName: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userName: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userEmail: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userPhone: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userWebsite: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private lazy var userStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userId, usersName, userName, userEmail, userPhone, userWebsite])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    //    Address
    private let userAddress: UILabel = {
        let label = UILabel()
        label.text = "User Address"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let userStreet: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userSuite: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userCity: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userZipCode: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userLat: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userLng: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private lazy var addressStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userStreet, userSuite, userCity, userZipCode, userLat, userLng])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    //    Company
    private let userCompany: UILabel = {
        return UILabel(labelText: "User Company", textColor: .black)
    }()
    
    private let userCompanyName: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userCompanyCatchPhrase: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private let userCompanyBS: UILabel = {
        return UILabel(textColor: .black, textFont: .systemFont(ofSize: 17, weight: .medium))
    }()
    
    private lazy var companyStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userCompanyName, userCompanyCatchPhrase, userCompanyBS])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    
    //  MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        view.addSubview(userTitle)
        view.addSubview(userStack)
        view.addSubview(userAddress)
        view.addSubview(addressStack)
        view.addSubview(userCompany)
        view.addSubview(companyStack)
    }
    
    private func setInformation() {
        if let id = user?.id  {
            userId.text = "User ID: \(id)"
        } else {
            userId.text = "User ID: \(0)"
        }
        usersName.text = "User Name: \(user?.name ?? "")"
        userName.text = "User UserName: \(user?.username ?? "")"
        userEmail.text = "User Email: \(user?.email ?? "")"
        userPhone.text = "User Phone Number: \(user?.phone ?? "")"
        userWebsite.text = "Users WebSite: \(user?.website ?? "")"
        
        userStreet.text = "Users Street: \(user?.address.street ?? "")"
        userSuite.text = "Users Suite: \(user?.address.suite ?? "")"
        userCity.text = "Users City: \(user?.address.city ?? "")"
        userZipCode.text = "Users ZipCode: \(user?.address.zipcode ?? "")"
        userLat.text = "Users Latitude: \(user?.address.geo.lat ?? "")"
        userLng.text = "Users Longitude: \(user?.address.geo.lng ?? "")"
        
        userCompanyName.text = "Users Company Name: \(user?.company.name ?? "")"
        userCompanyCatchPhrase.text = "Users Company Catch Phrase: \(user?.company.catchPhrase ?? "")"
        userCompanyBS.text = "Users BS \(user?.company.bs ?? "")"
    }
    
    private func setupConstrains() {
        userTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        userStack.snp.makeConstraints { make in
            make.top.equalTo(userTitle.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        userAddress.snp.makeConstraints { make in
            make.top.equalTo(userStack.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        addressStack.snp.makeConstraints { make in
            make.top.equalTo(userAddress.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        userCompany.snp.makeConstraints { make in
            make.top.equalTo(addressStack.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        companyStack.snp.makeConstraints { make in
            make.top.equalTo(userCompany.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
    }
    
    
}


