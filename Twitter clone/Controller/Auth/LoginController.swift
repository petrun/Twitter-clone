//
//  LoginController.swift
//  Twitter clone
//
//  Created by andy on 19.03.2021.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - Properties

    let logoImageView = UIImageView(
        image: UIImage(named: "TwitterLogo")
    )

    let emailViewContainer = UIView.fieldContainer(
        textField: .withPlaceholder("Email"),
        image: UIImage(named: "mail")
    )

    let passwordViewContainer = UIView.fieldContainer(
        textField: {
            let textField = UITextField.withPlaceholder("Password")
            textField.isSecureTextEntry = true
            return textField
        }(),
        image: UIImage(named: "ic_lock_outline_white_2x")
    )

    let submitButton: UIButton = {
        let button = UIButton.submitButton("Login")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        return button
    }()

    let dontHaveAccountButton: UIButton = {
        let button = UIButton.attributedButton(title: "Don't have account?", subTitle: " Registration")
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Targets

    @objc func handleLogin() {
        print("login click")
    }

    @objc func handleRegistration() {
        print("reg click")
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .twitterBlue

        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        view.addSubview(logoImageView)

        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)

        // stack

        let stack = UIStackView(arrangedSubviews: [
            emailViewContainer,
            passwordViewContainer,
            submitButton
        ])
        stack.axis = .vertical
        stack.spacing = 20

        view.addSubview(stack)
        stack.anchor(
            top: logoImageView.bottomAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingLeft: 16,
            paddingRight: 16
        )

        // dontHaveAccountButton

        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }

}
