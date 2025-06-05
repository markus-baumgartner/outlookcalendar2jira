import XCTest
@testable import outlookcalendar2jira

final class ExampleTests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue("ABC-123".firstJiraIssue() == "ABC-123")
    }
}
