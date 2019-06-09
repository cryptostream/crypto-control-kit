//
//  File.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

enum News {
    case articles(category: Category? = nil, token: String? = nil, latest: Bool? = nil, language: Locale? = nil,  sentiment: Bool? = nil)
    
    var path: String {
        switch self {
        case .articles(let category, let token, _, _, _):
            switch (category, token) {
            case (.some(let c), .none):
                return "/api/v1/public/news/\(c)"
            case (.none, .some(let t)):
                return "/api/v1/public/news/coin/\(t)"
            case (.some(let c), .some(let t)):
                return "/api/v1/public/news/coin/\(t)/\(c)"
            default:
                return "/api/v1/public/news"
            }
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .articles(_, _, let latest, let language, let sentiment):
            latest.flatMap {
                queryItems.append(URLQueryItem(name: "latest", value: $0.description))
            }
            language?.languageCode.flatMap {
                queryItems.append(URLQueryItem(name: "language", value: $0))
            }
            sentiment.flatMap {
                queryItems.append(URLQueryItem(name: "sentiment", value: $0.description))
            }
        }
        
        return queryItems
    }
    
    var model: ResponseModel {
        switch self {
        case .articles: return .articles([ArticleItem].self)
        }
    }
}
