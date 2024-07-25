//
//  File.swift
//  ImageFeedTests
//
//  Created by Ilya Kalin on 25.07.2024.
//

import Foundation
import ImageFeed

final class ImagesListViewControllerSpy: ImagesListViewControllerProtocol {
    var presenter: ImageFeed.ImagesListPresenterProtocol?
    var updateTableViewAnimatedWasCalled: Bool = false

    func viewDidLoad() {
        presenter?.fetchPhotosNextPage()
    }

    func updateTableViewAnimated() {
        updateTableViewAnimatedWasCalled = true
    }
}
