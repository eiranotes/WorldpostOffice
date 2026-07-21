import SwiftUI

@main
struct WorldPostOfficeHomeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
        }
    }
}
