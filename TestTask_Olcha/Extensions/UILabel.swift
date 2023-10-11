//
//  UILabel.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import UIKit

extension UILabel {
    
    convenience init(textColor: UIColor, textFont: UIFont) {
        self.init()
        self.textColor = textColor
        self.font = textFont
        self.numberOfLines = 0

    }
    
    //  MARK: - Title Label
    convenience init(labelText: String, textColor: UIColor) {
        self.init()
        self.text = labelText
        self.textColor = textColor
        self.font = .systemFont(ofSize: 32, weight: .bold)
        self.textAlignment = .center
    }
    
}
