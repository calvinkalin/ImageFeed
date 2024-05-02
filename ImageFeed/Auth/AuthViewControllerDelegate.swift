//
//  AuthViewControllerDelegate.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 01.05.2024.
//

import Foundation


protocol AuthViewControllerDelegate: AnyObject {
    func authViewController(_ vc: AuthViewController, didAuthenticateWithCode code: String)
    func didAuthenticate(_ vc: AuthViewController)
}
