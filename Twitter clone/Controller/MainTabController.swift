//
//  MainTabController.swift
//  Twitter clone
//
//  Created by andy on 19.03.2021.
//

import UIKit

class MainTabController: UITabBarController {

    // MARK: - Properties

    let actionButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureViewControllers()
    }

    // MARK: - Selectors

    @objc func actionButtonTapped() {
        print("123")
    }

    // MARK: - Helpers

    func configureUI() {
        view.addSubview(actionButton)

        actionButton.anchor(
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingBottom: 64,
            paddingRight: 16,
            width: 56,
            height: 56
        )

        actionButton.layer.cornerRadius = 56 / 2
    }

    func configureViewControllers() {
        let feed = configureNavigationController(
            image: UIImage(named: "home_unselected"),
            rootViewController: FeedController()
        )

        let explore = configureNavigationController(
            image: UIImage(named: "search_unselected"),
            rootViewController: ExploreController()
        )

        let notifications = configureNavigationController(
            image: UIImage(named: "like_unselected"),
            rootViewController: NotificationsController()
        )

        let conversations = configureNavigationController(
            image: UIImage(named: "ic_mail_outline_white_2x-1"),
            rootViewController: ConversationsController()
        )

        viewControllers = [
            feed,
            explore,
            notifications,
            conversations,
        ]
    }

    func configureNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        rootViewController.view.backgroundColor = .white
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white

        return nav
    }

}
