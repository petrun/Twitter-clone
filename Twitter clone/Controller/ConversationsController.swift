//
//  ConversationsController.swift
//  Twitter clone
//
//  Created by andy on 19.03.2021.
//

import UIKit

class ConversationsController: UIViewController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white

        navigationItem.title = "Conversations"
    }

}
