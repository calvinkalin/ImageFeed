//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 20.03.2024.
//

import Foundation
import UIKit
import Kingfisher

final class ProfileViewController: UIViewController {
    private let imageView = UIImageView()
    private let exitButton = UIButton()
    private let nameLabel = UILabel()
    private let tagLabel = UILabel()
    private let bioLabel = UILabel()
    
    private let profileService = ProfileService.shared
    private let profileImageService = ProfileImageService.shared
    private let oAuth2TokenStorage = OAuth2TokenStorage()
    private let profileLogoutService = ProfileLogoutService.shared
    
    private var profileImageServiceObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageServiceObserver = NotificationCenter.default
            .addObserver(
                forName: ProfileImageService.didChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                guard let self = self else { return }
                self.updateAvatar()
            }
        updateAvatar()
        
        guard let profileModel = profileService.profileModel else {
            print("Try to read: profileService.profileModel")
            return }
        setupView()
        updateView(data: profileModel)
    }
    
    @objc
    private func didTapButton() {
        showAlert()
    }
}

extension ProfileViewController {
    func updateView(data: Profile) {
        nameLabel.text = data.name
        tagLabel.text = data.loginName
        bioLabel.text = data.bio
    }
    
    func updateAvatar() {
        guard let profileImageURL = ProfileImageService.shared.profileImageURL,
              let url = URL(string: profileImageURL)
        else { return }
        imageView.kf.setImage(with: url)
    }
}

extension ProfileViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: "Пока, пока!",
            message: "Уверены что хотите выйти?",
            preferredStyle: .alert
        )
        
        let yesAction = UIAlertAction(
            title: "Да",
            style: .default) { _ in
                alert.dismiss(animated: true)
                self.profileLogoutService.logout()
                
                guard let window = UIApplication.shared.windows.first else {
                    assertionFailure("confirmExit Invalid Configuration")
                    return
                }
                window.rootViewController = SplashViewController()
            }
        
        let noAction = UIAlertAction(
            title: "Нет",
            style: .default) { _ in
                alert.dismiss(animated: true)
            }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
}

extension ProfileViewController {
    private func  setupView() {
        view.backgroundColor = UIColor(named: "Background")
        configUIElements()
    }
    
    private func configUIElements() {
        profileImageConfig()
        exitButtonConfig()
        nameLabelConfig()
        nickNameLabelConfig()
        descriptionLabelConfig()
    }
    
    private func profileImageConfig() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func exitButtonConfig() {
        let exitImage = UIImage(named: "logout_button")
        guard let exitImage else { return }
        let exitButton = UIButton.systemButton(
            with: exitImage,
            target: self,
            action: #selector(Self.didTapButton)
        )
        exitButton.setImage(exitImage, for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            exitButton.widthAnchor.constraint(equalToConstant: 24),
            exitButton.heightAnchor.constraint(equalToConstant: 24),
            exitButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
    }
    
    private func nameLabelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)
        ])
    }
    
    private func nickNameLabelConfig() {
        tagLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        tagLabel.textColor = .gray
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tagLabel)
        
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            tagLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func descriptionLabelConfig() {
        bioLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        bioLabel.textColor = .white
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            bioLabel.leadingAnchor.constraint(equalTo: tagLabel.leadingAnchor),
            bioLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 8)
        ])
    }
}
