//
//  Tweets.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

enum Tweets {
    case tweets(token: String, latest: Bool? = nil)
    
    var path: String {
        switch self {
        case .tweets(let token, _):
            return "/api/v1/public/tweets/coin/\(token)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .tweets(_, let latest):
            latest.flatMap {
                queryItems.append(URLQueryItem(name: "latest", value: $0.description))
            }
        }
        
        return queryItems
    }
    
    var model: ResponseModel {
        switch self {
        case .tweets: return .tweets([TweetItem].self)
        }
    }
}
