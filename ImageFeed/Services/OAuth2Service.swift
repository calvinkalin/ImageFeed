//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 22.04.2024.
//

import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    
    private init() {}
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest {
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
            preconditionFailure("Error: unable to construct url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    
    func fetchOAuthToken(for code: String, completion: @escaping (Result<String,Error>) -> Void) {
        let requestWithCode = makeOAuthTokenRequest(code: code)
        
        let task = URLSession.shared.data(for: requestWithCode){ result in
            switch result {
            case .success(let data):
                do {
                    let oAuthToken = try JSONDecoder().decode(OAuthTokenResponseBody.self, from:data)
                    guard let accessToken = oAuthToken.accessToken else {
                        fatalError("Error: can`t decode token!")
                    }
                    completion(.success(accessToken))
                } catch {
                    completion(.failure(error))
                    print("Error: error of requesting: \(error)")
                }
            case .failure(let error):
                completion(.failure(error))
                print("Error: error of requesting: \(error)")
            }
        }
        
        task.resume()
    }
}
