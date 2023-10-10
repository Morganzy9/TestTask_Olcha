//
//  UILabel.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import UIKit

extension UILabel {
    
    convenience init(labelText: String, textColor: UIColor) {
        self.init()
        self.text = labelText
        self.textColor = textColor
    }
    
}
