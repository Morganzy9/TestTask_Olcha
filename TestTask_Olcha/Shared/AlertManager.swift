//
//  Theme.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/12/23.
//

import UIKit

class AlertManager {
    
    static let shared = AlertManager()
    
    private init() {}
    
    func disspearingAlert(_ viewController: UIViewController,message: String, dissapearsAfter: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        viewController.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + dissapearsAfter) {
            alert.dismiss(animated: true, completion: nil)
        }
    }

}
