//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 15.05.2024.
//

import Foundation
import SwiftKeychainWrapper

protocol OAuth2TokenStorageProtocol {
    var token: String? { get set }
}

final class OAuth2TokenStorage: OAuth2TokenStorageProtocol {
    
    private enum Keys: String {
        case token
    }
    
    var token: String? {
        get {
            return KeychainWrapper.standard.string(forKey: Keys.token.rawValue)
        }
        set {
            guard let newValue else { return }
            KeychainWrapper.standard.set(newValue, forKey: Keys.token.rawValue)
        }
    }
    
    func resetToken() {
        KeychainWrapper.standard.removeObject(forKey: Keys.token.rawValue)
    }
}
