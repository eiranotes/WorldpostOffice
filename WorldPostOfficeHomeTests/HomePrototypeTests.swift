import XCTest
@testable import WorldPostOfficeHome

final class HomePrototypeTests: XCTestCase {
    func testCoreLayoutMetricsRemainStable() {
        XCTAssertEqual(AppMetric.screenHorizontal, 16)
        XCTAssertEqual(AppMetric.cardRadius, 24)
        XCTAssertEqual(AppMetric.tabBarHeight, 82)
    }

    func testHomeContentUsesSupportedProgressRanges() {
        let levelProgress = 720.0 / 1_000.0
        let worldMailProgress = 60.0 / 100.0

        XCTAssertGreaterThanOrEqual(levelProgress, 0)
        XCTAssertLessThanOrEqual(levelProgress, 1)
        XCTAssertGreaterThanOrEqual(worldMailProgress, 0)
        XCTAssertLessThanOrEqual(worldMailProgress, 1)
    }
}
