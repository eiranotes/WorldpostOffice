import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ResponsiveUserHeaderView()
                    ResponsiveGreetingBanner()
                    PrimaryQuestCard()
                    EnergyProgressCard()
                    ActiveExchangeCard()
                    QuickActionsRow()
                }
                .padding(.horizontal, AppMetric.screenHorizontal)
                .padding(.top, 8)
                .padding(.bottom, 14)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomTabBar()
        }
    }
}

#Preview("Home") {
    HomeView()
        .previewDevice("iPhone 15 Pro")
}
