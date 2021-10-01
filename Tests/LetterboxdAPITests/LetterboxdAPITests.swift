import XCTest
@testable import LetterboxdAPI

final class LetterboxdAPITests: XCTestCase {
    func testAPIKeysSetup() {
        LetterboxdAPI.setUpAPIKeys(publicAPI: "test", privateAPI: "test")
        XCTAssertNotEqual(Private.privateAPIKey, "")
        XCTAssertNotEqual(Private.publicAPIKey, "")
    }
}
