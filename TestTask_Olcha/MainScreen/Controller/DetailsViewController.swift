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
        return UIStackView(axis: .vertical, backgroundColor: .darkWhite, spacing: 5, distribution: .fill, conrnerRadius: 10.0)
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
    
    private let addressStack: UIStackView = {
        return UIStackView(axis: .vertical, backgroundColor: .darkWhite, spacing: 5, distribution: .fill, conrnerRadius: 10.0)
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
        stackView.backgroundColor = .darkWhite
        stackView.layer.cornerRadius = 10.0
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
        userStack.addArrangedSubview(userId)
        userStack.addArrangedSubview(usersName)
        userStack.addArrangedSubview(userName)
        userStack.addArrangedSubview(userEmail)
        userStack.addArrangedSubview(userPhone)
        userStack.addArrangedSubview(userWebsite)
        view.addSubview(userAddress)
        view.addSubview(addressStack)
        addressStack.addArrangedSubview(userStreet)
        addressStack.addArrangedSubview(userSuite)
        addressStack.addArrangedSubview(userCity)
        addressStack.addArrangedSubview(userZipCode)
        addressStack.addArrangedSubview(userLat)
        addressStack.addArrangedSubview(userLng)
        view.addSubview(userCompany)
        view.addSubview(companyStack)
        companyStack.addArrangedSubview(userCompanyName)
        companyStack.addArrangedSubview(userCompanyCatchPhrase)
        companyStack.addArrangedSubview(userCompanyBS)
    }
    
    private func setInformation() {
        if let id = user?.id  {
            userId.text = "ID: \(id)"
        } else {
            userId.text = "ID: \(0)"
        }
        usersName.text = "Name: \(user?.name ?? "")"
        userName.text = "UserName: \(user?.username ?? "")"
        userEmail.text = "Email: \(user?.email ?? "")"
        userPhone.text = "Phone Number: \(user?.phone ?? "")"
        userWebsite.text = "WebSite: \(user?.website ?? "")"
        
        userStreet.text = "Street: \(user?.address.street ?? "")"
        userSuite.text = "Suite: \(user?.address.suite ?? "")"
        userCity.text = "City: \(user?.address.city ?? "")"
        userZipCode.text = "ZipCode: \(user?.address.zipcode ?? "")"
        userLat.text = "Latitude: \(user?.address.geo.lat ?? "")"
        userLng.text = "Longitude: \(user?.address.geo.lng ?? "")"
        
        userCompanyName.text = "Company Name: \(user?.company.name ?? "")"
        userCompanyCatchPhrase.text = "Company Catch Phrase: \(user?.company.catchPhrase ?? "")"
        userCompanyBS.text = "BS: \(user?.company.bs ?? "")"
    }
    
    private func setupConstrains() {
        userTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        userStack.snp.makeConstraints { make in
            make.top.equalTo(userTitle.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        
        for element in userStack.arrangedSubviews {
            element.snp.makeConstraints { make in
                make.leading.equalTo(userStack.snp.leading).offset(10)
            }
        }
        userAddress.snp.makeConstraints { make in
            make.top.equalTo(userStack.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        addressStack.snp.makeConstraints { make in
            make.top.equalTo(userAddress.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        
        for element in addressStack.arrangedSubviews {
            element.snp.makeConstraints { make in
                make.leading.equalTo(addressStack.snp.leading).offset(10)
            }
        }
        userCompany.snp.makeConstraints { make in
            make.top.equalTo(addressStack.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        companyStack.snp.makeConstraints { make in
            make.top.equalTo(userCompany.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        
        for element in companyStack.arrangedSubviews {
            element.snp.makeConstraints { make in
                make.leading.equalTo(companyStack.snp.leading).offset(10)
            }
        }
    }
    
    
}


