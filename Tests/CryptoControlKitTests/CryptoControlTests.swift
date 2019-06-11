import XCTest
@testable import CryptoControlKit

final class CryptoControlTests: XCTestCase {
    
    private let cryptoControl = CryptoControl(key: "<KEY-HERE>")
    
    func testCryptoControl_request() {
        let expect = XCTestExpectation(description: "Endpoint Request")
        
        cryptoControl.request(endpoint: CryptoControlAPI.news(.newsCategory(token: "bitcoin")).endpoint) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure: XCTFail("failure")
            }
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 2)
    }

    static var allTests = [
        ("testCryptoControl_request", testCryptoControl_request),
    ]
}
