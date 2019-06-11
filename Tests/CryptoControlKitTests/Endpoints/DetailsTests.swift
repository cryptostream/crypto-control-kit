//
//  File.swift
//  
//
//  Created by Joe Blau on 6/10/19.
//

import XCTest
@testable import CryptoControlKit

final class DetailsTests: XCTestCase {
    
    func testDetails_coin () {
        XCTAssertEqual(CryptoControlAPI.coinDetails(.coinDetails(token: "BTC")).endpoint.components.string,
                       "https://cryptocontrol.io/api/v1/public/details/coin/BTC")
    }
    
}
