//
//  TabBarController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 23.05.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        let imagesListViewController = storyboard.instantiateViewController(identifier: "ImagesListViewController")
        let profileViewController = ProfileViewController()
        
        profileViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tab_profile_active"),
            selectedImage: nil
        )
        imagesListViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tab_editorial_active"),
            selectedImage: nil
        )
        
        self.viewControllers = [ imagesListViewController, profileViewController]
    }
}
