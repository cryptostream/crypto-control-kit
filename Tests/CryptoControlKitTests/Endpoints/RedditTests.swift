//
//  File.swift
//  
//
//  Created by Joe Blau on 6/10/19.
//

import XCTest
@testable import CryptoControlKit

final class RedditTests: XCTestCase {
    
    func testReddit_reddit () {
        XCTAssertEqual(CryptoControlAPI.reddit(.reddit(token: "BTC")).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/reddit/coin/BTC")
    }
    
    func testReddit_reddit_token_latestFalse() {
        XCTAssertEqual(CryptoControlAPI.reddit(.reddit(token: "BTC", latest: false)) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/reddit/coin/BTC?latest=false")
    }
    
    func testReddit_reddit_token_latestTrue() {
        XCTAssertEqual(CryptoControlAPI.reddit(.reddit(token: "BTC", latest: true)) .endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/reddit/coin/BTC?latest=true")
    }
    
}
