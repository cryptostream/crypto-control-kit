//
//  File.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

enum News {
    case news(token: String? = nil, latest: Bool? = nil, language: Locale? = nil,  sentiment: Bool? = nil)
    case newsCategory(token: String? = nil)
    
    var path: String {
        switch self {
        case .news(let token, _, _, _):
            switch token {
            case .some(let t): return "/api/v1/public/news/coin/\(t)"
            case .none: return "/api/v1/public/news"
            }
        case .newsCategory(let token):
            switch token {
            case .some(let t): return "/api/v1/public/news/coin/\(t)/category"
            case .none: return "/api/v1/public/news/category"
            }
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .news(_, let latest, let language, let sentiment):
            latest.flatMap {
                queryItems.append(URLQueryItem(name: "latest", value: $0.description))
            }
            language?.languageCode.flatMap {
                queryItems.append(URLQueryItem(name: "language", value: $0))
            }
            sentiment.flatMap {
                queryItems.append(URLQueryItem(name: "sentiment", value: $0.description))
            }
        case .newsCategory: break
        }
        
        return queryItems
    }
    
    var model: ResponseModel {
        switch self {
        case .news: return .news([ArticleItem].self)
        case .newsCategory: return .newsCategory(Category.self)
        }
    }
}
