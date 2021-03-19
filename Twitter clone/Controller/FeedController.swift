//
//  FeedController.swift
//  Twitter clone
//
//  Created by andy on 19.03.2021.
//

import UIKit

class FeedController: UIViewController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white

        let logoView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        logoView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = logoView
    }

}
