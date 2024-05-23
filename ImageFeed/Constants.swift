//
//  Constants.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 15.05.2024.
//

import Foundation

enum Constants {
    static let accessKey = "4t3RL4vzPDJCK9R9KvQ_IeGwbQ28P_fnXfcGBrXFqmU"
    static let secretKey = "_kFTVVo8p08SrnElbRayS4FWAkG8CfDZyc7oVQVWt4Y"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL = URL(string: "https://api.unsplash.com/")!
}

enum WebViewConstants {
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}
