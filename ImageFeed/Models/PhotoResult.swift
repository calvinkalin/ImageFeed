//
//  PhotoResult.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 23.05.2024.
//

import Foundation

struct PhotoResult: Codable {
    let id: String
    let created_at: String?
    let width, height: Double
    let likedByUser: Bool
    let description: String?
    let urls: UrlsResult
}
