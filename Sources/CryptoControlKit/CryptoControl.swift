//
//  CryptoControl.swift
//
//
//  Created by Joe Blau on 6/4/19.
//

import Foundation

public final class CryptoControl {
    private var key: String
    private let decoder = JSONDecoder()
    private let sharedSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpMaximumConnectionsPerHost = 8
        return URLSession(configuration: configuration)
    }()
    
    init(key: String) {
        self.key = key
    }
    
    public func request(endpoint: CryptoControlAPIEndpoint, completion: @escaping (Result<Decodable, Error>) -> Void) {
        guard let request = buildRequest(endpoint: endpoint) else {
            return
        }
        
        let task = sharedSession.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    switch endpoint.responseModel {
                    // Articles
                    case .articles(let type): completion(.success(try self.decoder.decode(type, from: data)))
                        
                    // Reddit
                    case .reddit(let type): completion(.success(try self.decoder.decode(type, from: data)))
                        
                    // Tweets
                    case .tweets(let type): completion(.success(try self.decoder.decode(type, from: data)))
                        
                    // Feed
                    case .feed(let type): completion(.success(try self.decoder.decode(type, from: data)))
                        
                    // Coin Details
                    case .coinDetails(let type): completion(.success(try self.decoder.decode(type, from: data)))
                    }
                    
                } catch {
                    print(error)
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func buildRequest(endpoint: CryptoControlAPIEndpoint) -> URLRequest? {
        guard let url = endpoint.components.url else { return nil }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(key, forHTTPHeaderField: "x-api-key")
        return request
    }
    
}
