//
//  UIView.swift
//  Twitter clone
//
//  Created by andy on 24.03.2021.
//

import UIKit

extension UIView {
    static func fieldContainer(textField: UITextField, image: UIImage?) -> UIView {
        // View
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // ImageView
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .white

        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.setDimensions(width: 25, height: 25)
        imageView.anchor(
            left: view.leftAnchor
        )

        // TextField
        view.addSubview(textField)
        textField.anchor(
            left: imageView.rightAnchor,
            right: view.rightAnchor,
            paddingLeft: 8
        )
        textField.centerY(inView: view)

        // Separator
        let separator = UIView()
        separator.backgroundColor = .white

        view.addSubview(separator)
        separator.anchor(
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            height: 0.75
        )

        return view
    }
}
