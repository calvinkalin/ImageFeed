//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 15.05.2024.
//

import Foundation

enum AuthServiceError: Error {
    case invalidRequest
}

final class OAuth2Service {
    static let shared = OAuth2Service()
    
    private var task: URLSessionTask?
    private var lastCode: String?
    
    private init() {}
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest? {
        guard let baseURL = URL(string: "https://unsplash.com") else {
            preconditionFailure("Error: unable to construct baseUrl")
        }
        guard let url = URL(
            string: "/oauth/token"
            + "?client_id=\(Constants.accessKey)"
            + "&&client_secret=\(Constants.secretKey)"
            + "&&redirect_uri=\(Constants.redirectURI)"
            + "&&code=\(code)"
            + "&&grant_type=authorization_code",
            relativeTo: baseURL
        ) else {
            assertionFailure("Error: failed to create URL")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    
    func fetchOAuthToken(for code: String, completion: @escaping (Result<String,Error>) -> Void) {
        assert(Thread.isMainThread)
        guard lastCode != code else {
            completion(.failure(AuthServiceError.invalidRequest))
            return
        }
        
        guard task == nil else { return }
        
        lastCode = code
        
        guard let lastCode, let requestWithCode = makeOAuthTokenRequest(code: lastCode) else {
            completion(.failure(AuthServiceError.invalidRequest))
            return
        }
        
        let task = URLSession.shared.objectTask(for: requestWithCode) { [weak self] (result: Result<OAuthTokenResponseBody, Error>) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case.success(let decodedData):
                    guard let accessToken = decodedData.accessToken else {
                        preconditionFailure("[OAuth2Service]: can`t decode token!")
                    }
                    self.task = nil
                    self.lastCode = nil
                    completion(.success(accessToken))
                case .failure(let error):
                    completion(.failure(error))
                    print("[OAuth2Service]: \(error)")
                    self.task = nil
                    self.lastCode = nil
                }
                self.task = nil
            }
        }
        self.task = task
        task.resume()
    }
}
