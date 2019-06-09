//
//  Reddit.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

enum Reddit {
    case reddit(token: String, latest: Bool? = nil)
    
    var path: String {
        switch self {
        case .reddit(let token, _):
            return "/api/v1/public/reddit/coin/\(token)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .reddit(_, let latest):
            latest.flatMap {
                queryItems.append(URLQueryItem(name: "latest", value: $0.description))
            }
        }
        
        return queryItems
    }
    
    var model: ResponseModel {
        switch self {
        case .reddit: return .reddit([RedditItem].self)
        }
    }
}
