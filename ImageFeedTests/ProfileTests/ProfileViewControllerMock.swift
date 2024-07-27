//
//  ProfileViewControllerMock.swift
//  ImageFeedTests
//
//  Created by Ilya Kalin on 25.07.2024.
//

import Foundation
import ImageFeed
import UIKit

final class ProfileViewControllerMock: ProfileViewControllerProtocol {
    let imageView = UIImageView()
    let logoutButton = UIButton()
    let nameLabel = UILabel()
    let nickNameLabel = UILabel()
    let bioLabel = UILabel()

    var presenter: ImageFeed.ProfilePresenterProtocol?

    func updateView(data: ImageFeed.Profile) {
        nameLabel.text = data.name
        nickNameLabel.text = data.loginName
        bioLabel.text = data.bio
    }

    func setAvatar(url: URL) {}
}
