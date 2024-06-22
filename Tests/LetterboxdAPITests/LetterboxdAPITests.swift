@testable import LetterboxdAPI
import XCTest

final class LetterboxdAPITests: XCTestCase {
  func testURLBuilder() {
    let request = Path("/auth/token").generateRequest(withMethod: .post)
    XCTAssertEqual(request.httpMethod, "POST")
    XCTAssertEqual(request.url?.absoluteString, "https://api.letterboxd.com/api/v0/auth/token")
  }
}
