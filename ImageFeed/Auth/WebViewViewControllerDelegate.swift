//
//  WebViewViewControllerDelegate.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 17.04.2024.
//

import UIKit
import WebKit

protocol WebViewViewControllerDelegate: AnyObject {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) // WebViewViewController получил код
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) // пользователь нажал кнопку назад и отменил авторизацию
}
