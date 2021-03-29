//
//  RegistrationController.swift
//  Twitter clone
//
//  Created by andy on 24.03.2021.
//

import UIKit

class RegistrationController: UIViewController {

    // MARK: - Properties

    let profileImageSize: (width: CGFloat, height: CGFloat) = (128, 128)

    let profileImage = UIImage(named: "plus_photo")?.withRenderingMode(.alwaysTemplate)

    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(profileImage, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)

        return button
    }()

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

    let fullnameViewContainer = UIView.fieldContainer(
        textField: .withPlaceholder("Fullname"),
        image: UIImage(named: "ic_person_outline_white_2x")
    )

    let usernameViewContainer = UIView.fieldContainer(
        textField: .withPlaceholder("Username"),
        image: UIImage(named: "ic_person_outline_white_2x")
    )

    let submitButton: UIButton = {
        let button = UIButton.submitButton("Login")
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)

        return button
    }()

    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton.attributedButton(title: "Already have an account?", subTitle: " Login")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Targets

    @objc func handleShowLogin() {
        print("login click")

        navigationController?.popViewController(animated: true)
    }

    @objc func handleRegistration() {
        print("reg click")
    }

    @objc func handleAddPhoto() {
        print("handleAddPhoto")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == false {
            return
        }

        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .twitterBlue

        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        view.addSubview(addPhotoButton)

        addPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        addPhotoButton.setDimensions(width: profileImageSize.width, height: profileImageSize.height)

        // stack

        let stack = UIStackView(arrangedSubviews: [
            emailViewContainer,
            passwordViewContainer,
            fullnameViewContainer,
            usernameViewContainer,
            submitButton
        ])
        stack.axis = .vertical
        stack.spacing = 20

        view.addSubview(stack)
        stack.anchor(
            top: addPhotoButton.bottomAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingLeft: 16,
            paddingRight: 16
        )

        // dontHaveAccountButton

        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }

    private func setUserImage(image: UIImage) {
        addPhotoButton.setImage(image, for: .normal)
        addPhotoButton.imageView?.layer.cornerRadius = profileImageSize.height / 2
        addPhotoButton.imageView?.layer.borderWidth = 3
        addPhotoButton.imageView?.layer.borderColor = UIColor.white.cgColor
    }

}


extension RegistrationController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        setUserImage(image: image)

        dismiss(animated: true)
    }
}

extension RegistrationController: UINavigationControllerDelegate {}
