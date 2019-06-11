//
//  File.swift
//  
//
//  Created by Joe Blau on 6/10/19.
//

import XCTest
@testable import CryptoControlKit

final class FeedTests: XCTestCase {
    
    func testFeeds_feed_token() {
        XCTAssertEqual(CryptoControlAPI.feed(.feed(token: "BTC")) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/feed/coin/BTC")
    }
    
    func testFeed_feed_token_latestFalse() {
        XCTAssertEqual(CryptoControlAPI.feed(.feed(token: "BTC", latest: false)) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/feed/coin/BTC?latest=false")
    }
    
    func testFeed_feed_token_latestTrue() {
        XCTAssertEqual(CryptoControlAPI.feed(.feed(token: "BTC", latest: true)) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/feed/coin/BTC?latest=true")
    }
    
}
