//
//  File.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

enum Feed {
    case feed(token: String, latest: Bool? = nil)
    
    var path: String {
        switch self {
        case .feed(let token, _):
            return "/api/v1/public/feed/coin/\(token)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .feed(_, let latest):
            latest.flatMap {
                queryItems.append(URLQueryItem(name: "latest", value: $0.description))
            }
        }
        
        return queryItems
    }
    
    var model: ResponseModel {
        switch self {
        case .feed: return .feed([FeedItem].self)
        }
    }
}
