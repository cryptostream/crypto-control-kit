//
//  File.swift
//  
//
//  Created by Joe Blau on 6/10/19.
//

import XCTest
@testable import CryptoControlKit

final class NewsTests: XCTestCase {
    
    func testNews_articles() {
        XCTAssertEqual(CryptoControlAPI.news(.news()).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news")
    }
    
    func testNews_news_token() {
        XCTAssertEqual(CryptoControlAPI.news(.news(token: "BTC")).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC")
    }
    
    func testNews_news_token_latestTrue() {
        XCTAssertEqual(CryptoControlAPI.news(.news(token: "BTC", latest: true)).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC?latest=true")
    }
    
    func testNews_news_token_latestFalse() {
        XCTAssertEqual(CryptoControlAPI.news(.news(token: "BTC", latest: false)).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC?latest=false")
    }
    
    
    func testNews_news_token_latest_language() {
        XCTAssertEqual(CryptoControlAPI.news(.news(token: "BTC", latest: true, language: Locale.init(identifier: "en"))).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC?latest=true&language=en")
    }
    
    func testNews_news_token_latest_language_sentimentTrue() {
        XCTAssertEqual(CryptoControlAPI.news(.news(token: "BTC", latest: true, language: Locale.init(identifier: "en"), sentiment: true)).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC?latest=true&language=en&sentiment=true")
    }
    
    func testNews_news_token_latest_language_sentimentFalse() {
        XCTAssertEqual(CryptoControlAPI.news(.news(token: "BTC", latest: true, language: Locale.init(identifier: "en"), sentiment: true)).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC?latest=true&language=en&sentiment=true")
    }
    
    func testNews_newsCategories() {
        XCTAssertEqual(CryptoControlAPI.news(.newsCategory()).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/category")
    }
    
    func testNews_newsCategories_token() {
        XCTAssertEqual(CryptoControlAPI.news(.newsCategory(token: "BTC")).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/news/coin/BTC/category")
    }
}
