//
//  UIButton.swift
//  Twitter clone
//
//  Created by andy on 24.03.2021.
//

import UIKit

extension UIButton {
    static func submitButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.twitterBlue, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5

        return button
    }

    static func attributedButton(title: String, subTitle: String) -> UIButton {
        let button = UIButton()

        let attributedString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        attributedString.append(NSAttributedString(string: subTitle, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red]))

        button.setAttributedTitle(attributedString, for: .normal)

        return button
    }
}
