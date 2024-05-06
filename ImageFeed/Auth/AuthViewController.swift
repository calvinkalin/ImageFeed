//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 16.04.2024.
//

import UIKit

final class AuthViewController: UIViewController {
    // MARK: - Private Properties
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = .white
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 16
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoImage = UIImage(named: "Logo")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
        
    weak var delegate: AuthViewControllerDelegate?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        configureBackButton()
        
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let webViewVC = storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as? WebViewViewController else {
            return
        }
        navigationController?.pushViewController(webViewVC, animated: true)    }
    
    // MARK: - Private Methods
    
    
    private func addSubviews() {
        view.addSubview(loginButton)
        view.addSubview(logoImageView)
    }
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_button")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_button")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            loginButton.widthAnchor.constraint(equalToConstant: 343),
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 640),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            logoImageView.widthAnchor.constraint(equalToConstant: 60),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 376),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - WebViewViewControllerDelegate
extension AuthViewController: WebViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        delegate?.authViewController(self, didAuthenticateWithCode: code)
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
