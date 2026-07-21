import XCTest

final class HomeSmokeUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testHomeScreenRendersCoreQuestContent() throws {
        let app = XCUIApplication()
        app.launchArguments += [
            "-AppleLanguages", "(ko)",
            "-AppleLocale", "ko_KR",
            "-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryL"
        ]
        app.launch()

        XCTAssertTrue(
            app.staticTexts["home.profile.alias"].waitForExistence(timeout: 15),
            "Anonymous profile alias should be visible."
        )
        XCTAssertTrue(
            app.buttons["home.quest.start"].waitForExistence(timeout: 10),
            "Primary system-quest action should be visible."
        )

        let exchangeTitle = app.staticTexts["home.exchange.title"]
        if !exchangeTitle.waitForExistence(timeout: 2) {
            app.swipeUp()
        }
        XCTAssertTrue(
            exchangeTitle.waitForExistence(timeout: 10),
            "Active global exchange card should be present in the scroll view."
        )

        let screenshot = XCTAttachment(screenshot: app.screenshot())
        screenshot.name = "home-screen"
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
}
