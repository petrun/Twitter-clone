//
//  ExploreController.swift
//  Twitter clone
//
//  Created by andy on 19.03.2021.
//

import UIKit

class ExploreController: UIViewController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white

        navigationItem.title = "Explore"
    }

}
