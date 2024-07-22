//
//  ImagesListPresenterMock.swift
//  ImageFeedTests
//
//  Created by Ilya Kalin on 22.07.2024.
//

import Foundation
import ImageFeed

final class ImagesListPresenterMock: ImagesListPresenterProtocol {
    private let imagesListService = ImagesListServiceSpy.shared
    var view: ImageFeed.ImagesListViewControllerProtocol?
    
    func fetchPhotosNextPage() {
        imagesListService.fetchPhotosNextPage()
    }
}
