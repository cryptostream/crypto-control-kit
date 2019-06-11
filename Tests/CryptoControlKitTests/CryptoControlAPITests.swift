//
//  File.swift
//  
//
//  Created by Joe Blau on 6/10/19.
//

import XCTest
@testable import CryptoControlKit

final class CryptoControlAPITests: XCTestCase {
    
    func testInstantiaton() {
        XCTAssertEqual(CryptoControlAPI.news(.news()).host, "cryptocontrol.io")
        XCTAssertEqual(CryptoControlAPI.news(.news()).scheme, "https")
    }
    
    static var allTests = [
        ("testInstantiaton", testInstantiaton),
    ]
}
