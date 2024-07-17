//
//  Photo.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 23.05.2024.
//

import Foundation

struct Photo {
    let id: String
    let size: CGSize
    let createdAt: Date?
    let welcomeDescription: String?
    let thumbImageURL: String
    let largeImageURL: String
    let isLiked: Bool
}
