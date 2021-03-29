//
//  UITextField.swift
//  Twitter clone
//
//  Created by andy on 24.03.2021.
//

import UIKit

extension UITextField {
    static func withPlaceholder(_ title: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])

        return textField
    }
}
