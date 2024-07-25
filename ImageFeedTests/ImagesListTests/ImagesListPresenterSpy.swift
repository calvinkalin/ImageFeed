//
//  File.swift
//  ImageFeedTests
//
//  Created by Ilya Kalin on 25.07.2024.
//

import Foundation
import ImageFeed

final class ImagesListPresenterSpy: ImagesListPresenterProtocol {
    var view: ImageFeed.ImagesListViewControllerProtocol?
    var fetchPhotosNextPageWasCalled: Bool = false

    func fetchPhotosNextPage() {
        fetchPhotosNextPageWasCalled = true
    }
}
