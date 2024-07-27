//
//  ProfileViewControllerSpy.swift
//  ImageFeedTests
//
//  Created by Ilya Kalin on 25.07.2024.
//

import Foundation
import ImageFeed

final class ProfileViewControllerSpy: ProfileViewControllerProtocol {
    var presenter: ImageFeed.ProfilePresenterProtocol?
    var updateViewWasCalled: Bool = false
    var setAvatarWasCalled: Bool = false

    func updateView(data: ImageFeed.Profile) {
        updateViewWasCalled = true
    }

    func setAvatar(url: URL) {
        setAvatarWasCalled = true
    }
}
