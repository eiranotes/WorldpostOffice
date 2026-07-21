import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ResponsiveUserHeaderView()
                    ResponsiveGreetingBanner()
                    PrimaryQuestCard()
                    EnergyProgressCard()
                    ActiveExchangeCard()
                    QuickActionsRow()
                }
                .padding(.horizontal, AppMetric.screenHorizontal)
                .padding(.top, 10)
                .padding(.bottom, 24)
            }
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
