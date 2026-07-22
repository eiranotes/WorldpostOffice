import XCTest
@testable import WorldPostOfficeHome

final class HomePrototypeTests: XCTestCase {
    func testCompactReferenceMetrics() {
        XCTAssertEqual(AppMetric.horizontal, 14)
        XCTAssertEqual(AppMetric.cardRadius, 24)
        XCTAssertEqual(AppMetric.tabHeight, 70)
    }

    func testProgressValuesAreValid() {
        XCTAssertTrue((0...1).contains(720.0 / 1_000.0))
        XCTAssertTrue((0...1).contains(60.0 / 100.0))
    }
}
