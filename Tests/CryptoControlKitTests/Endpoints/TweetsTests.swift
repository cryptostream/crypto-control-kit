//
//  File.swift
//  
//
//  Created by Joe Blau on 6/10/19.
//

import XCTest
@testable import CryptoControlKit

final class TweetsTests: XCTestCase {
    
    func testTweets_tweets_token() {
        XCTAssertEqual(CryptoControlAPI.tweets(.tweets(token: "BTC")) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/tweets/coin/BTC")
    }
    
    func testTweets_tweets_token_latestFalse() {
        XCTAssertEqual(CryptoControlAPI.tweets(.tweets(token: "BTC", latest: false)) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/tweets/coin/BTC?latest=false")
    }
    
    func testTweets_tweets_token_latestTrue() {
        XCTAssertEqual(CryptoControlAPI.tweets(.tweets(token: "BTC", latest: true)) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/tweets/coin/BTC?latest=true")
    }
    
}
