//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 01.05.2024.
//

import Foundation

protocol OAuth2TokenStorageProtocol {
    var token: String? { get set }
}

final class OAuth2TokenStorage: OAuth2TokenStorageProtocol {
    
    private enum Keys: String {
        case token
        
    }
    static let shared = OAuth2TokenStorage()
    private let userDefaults = UserDefaults.standard
    
    var token: String? {
        get {
            return userDefaults.string(forKey: Keys.token.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: Keys.token.rawValue)
        }
    }
    
    func logout() {
        userDefaults.removeObject(forKey: Keys.token.rawValue)
    }
}
