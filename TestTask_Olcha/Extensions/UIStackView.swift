//
//  UIStackView.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/11/23.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis, backgroundColor: UIColor, spacing: Int, distribution: UIStackView.Distribution, conrnerRadius: Double = 0.0) {
        self.init()
        self.axis = axis
        self.backgroundColor = backgroundColor
        self.spacing = CGFloat(spacing)
        self.distribution = distribution
        self.layer.cornerRadius = conrnerRadius
    }
    
}
