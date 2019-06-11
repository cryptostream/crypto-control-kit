//
//  File.swift
//
//
//  Created by Joe Blau on 6/8/19.
//

import Foundation

public struct CryptoControlAPIEndpoint {
    let components: URLComponents
    let responseModel: ResponseModel
}

enum CryptoControlAPI {
    case news(News)
    case reddit(Reddit)
    case tweets(Tweets)
    case feed(Feed)
    case coinDetails(Details)
    
    var endpoint: CryptoControlAPIEndpoint {
        var components = URLComponents()
        components.scheme = scheme
        components.host =  host
        
        switch self {
        case .news(let news):
            components.path = news.path
            components.queryItems = news.queryItems.isEmpty ? nil : news.queryItems
            return CryptoControlAPIEndpoint(components: components, responseModel: news.model)

        case .reddit(let reddit):
            components.path = reddit.path
            components.queryItems = reddit.queryItems.isEmpty ? nil : reddit.queryItems
            return CryptoControlAPIEndpoint(components: components, responseModel: reddit.model)

        case .tweets(let tweets):
            components.path = tweets.path
            components.queryItems = tweets.queryItems.isEmpty ? nil : tweets.queryItems
            return CryptoControlAPIEndpoint(components: components, responseModel: tweets.model)

        case .feed(let feed):
            components.path = feed.path
            components.queryItems = feed.queryItems.isEmpty ? nil : feed.queryItems
            return CryptoControlAPIEndpoint(components: components, responseModel: feed.model)

        case .coinDetails(let details):
            components.path = details.path
            return CryptoControlAPIEndpoint(components: components, responseModel: details.model)
        }
    }
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "cryptocontrol.io"
    }
}
