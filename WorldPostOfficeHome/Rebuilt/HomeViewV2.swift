import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 9) {
                    UserHeaderView()
                    GreetingBanner()
                    PrimaryQuestCard()
                    EnergyProgressCard()
                    ActiveExchangeCard()
                    QuickActionsRow()
                }
                .padding(.horizontal, AppMetric.horizontal)
                .padding(.top, 7)
                .padding(.bottom, 8)
                .frame(maxWidth: 430)
                .frame(maxWidth: .infinity)
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
        .previewDevice("iPhone 16 Pro")
}
