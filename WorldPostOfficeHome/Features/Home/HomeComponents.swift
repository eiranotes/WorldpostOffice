import SwiftUI

struct RibbonLabel: View {
    let icon: String
    let title: String
    var color: Color = AppColor.mintDark
    var background: Color = AppColor.mint.opacity(0.15)

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
            Text(title)
        }
        .font(.app(14, weight: .bold))
        .foregroundStyle(color)
        .padding(.horizontal, 12)
        .frame(height: 30)
        .background(
            background,
            in: UnevenRoundedRectangle(
                cornerRadii: .init(topLeading: 8, bottomLeading: 8, bottomTrailing: 4, topTrailing: 4)
            )
        )
    }
}

struct QuestMetaItem: View {
    let icon: String
    let title: String
    let value: String
    var tint: Color

    var body: some View {
        VStack(spacing: 3) {
            HStack(spacing: 3) {
                Image(systemName: icon)
                    .foregroundStyle(tint)
                Text(title)
                    .foregroundStyle(AppColor.secondaryInk)
            }
            .font(.app(9.1, weight: .medium))

            Text(value)
                .font(.app(11.1, weight: .bold))
                .foregroundStyle(AppColor.ink)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.68)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .padding(.horizontal, 2)
        .background(AppColor.surface.opacity(0.94), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
    }
}

struct PrimaryQuestCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RibbonLabel(icon: "sparkles", title: "오늘의 작은 모험")

            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("창가의 식물을\n물주고 사진 찍기")
                        .font(.app(20.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineSpacing(2)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("오늘 내 창가의 초록을 기록해요!")
                        .font(.app(12, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(2)
                        .minimumScaleFactor(0.82)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)

                PlantPolaroidArt()
                    .frame(width: 96, height: 118)
                    .appShadow(radius: 5, y: 2)
            }
            .frame(height: 118)

            HStack(spacing: 6) {
                QuestMetaItem(icon: "clock", title: "예상 시간", value: "5분 내외", tint: AppColor.mint)
                QuestMetaItem(icon: "camera.fill", title: "결과 유형", value: "사진", tint: AppColor.blue)
                QuestMetaItem(icon: "star.fill", title: "완료 보상", value: "우표 에너지 +20", tint: AppColor.gold)
            }

            Button(action: {}) {
                HStack(spacing: 8) {
                    ZStack {
                        Circle().fill(Color.white.opacity(0.96)).frame(width: 32, height: 32)
                        Image(systemName: "location.north.fill")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(AppColor.coral)
                    }
                    Spacer()
                    Text("모험 시작하기")
                        .font(.app(18, weight: .bold))
                    Spacer()
                    Color.clear.frame(width: 32, height: 32)
                }
                .foregroundStyle(Color.white)
                .padding(.horizontal, 10)
                .frame(height: 50)
                .background(
                    LinearGradient(
                        colors: [AppColor.coral.opacity(0.88), AppColor.coral],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    in: Capsule()
                )
                .appShadow(color: AppColor.coral.opacity(0.24), radius: 7, y: 3)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("home.quest.start")
        }
        .padding(14)
        .background(AppColor.surfaceMint.opacity(0.87), in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous)
                .stroke(AppColor.mint.opacity(0.24), lineWidth: 1.2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius - 8, style: .continuous)
                .stroke(AppColor.mint.opacity(0.16), style: StrokeStyle(lineWidth: 1, dash: [7, 5]))
                .padding(7)
        )
        .appShadow()
    }
}

struct EnergyProgressCard: View {
    var body: some View {
        HStack(spacing: 9) {
            ZStack {
                Circle().fill(AppColor.surfaceWarm).frame(width: 36, height: 36)
                Image(systemName: "bolt.fill")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(AppColor.gold)
            }

            VStack(alignment: .leading, spacing: 1) {
                Text("작은 모험을 완료하면")
                    .font(.app(9.8, weight: .medium))
                    .foregroundStyle(AppColor.secondaryInk)
                Text("세계 우편 교환이 열려요!")
                    .font(.app(10.8, weight: .bold))
                    .foregroundStyle(AppColor.mintDark)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 3) {
                    Text("우표 에너지")
                        .font(.app(9, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 9))
                        .foregroundStyle(AppColor.gold)
                    Text("60 / 100")
                        .font(.app(10.8, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                }
                ProgressView(value: 0.60)
                    .tint(AppColor.mint)
                    .frame(width: 86)
            }

            Image(systemName: "chevron.right")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(AppColor.gold)
        }
        .padding(.horizontal, 11)
        .frame(height: 58)
        .background(AppColor.surfaceWarm.opacity(0.78), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(AppColor.gold.opacity(0.34), lineWidth: 1))
        .appShadow(radius: 6, y: 2)
    }
}

struct ActiveExchangeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RibbonLabel(
                icon: "globe.asia.australia.fill",
                title: "세계 우편",
                color: Color(red: 0.12, green: 0.37, blue: 0.66),
                background: AppColor.blue.opacity(0.12)
            )

            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("현재 교환 진행 중!")
                        .accessibilityIdentifier("home.exchange.title")
                        .font(.app(18, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                    Text("익명의 여행자와 함께하는 특별한 교환이에요.")
                        .font(.app(10.5, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                        .minimumScaleFactor(0.76)
                }
                Spacer(minLength: 6)
                Text("D-3")
                    .font(.app(10, weight: .bold))
                    .foregroundStyle(AppColor.blue)
                    .padding(.horizontal, 8)
                    .frame(height: 23)
                    .background(AppColor.surfaceBlue, in: Capsule())
            }

            HStack(spacing: 7) {
                BunnyAvatarArt()
                    .frame(width: 48, height: 48)

                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Text("바람 토끼 091")
                            .font(.app(12, weight: .bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        Text("🇯🇵")
                            .font(.system(size: 12))
                    }
                    Text("일본 · 도쿄")
                        .font(.app(9.5, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                ZStack {
                    Capsule()
                        .stroke(AppColor.blue.opacity(0.40), style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
                        .frame(width: 48, height: 1)
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(AppColor.coral)
                        .padding(4)
                        .background(AppColor.surface)
                }
                .frame(width: 48, height: 30)

                TokyoPostcardArt()
                    .frame(width: 78, height: 64)
                    .appShadow(radius: 4, y: 2)
            }

            HStack(spacing: 6) {
                Label {
                    Text("완료 시 우표 에너지 +40")
                } icon: {
                    Image(systemName: "clock")
                        .foregroundStyle(AppColor.gold)
                }
                .font(.app(9.7, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)

                Spacer(minLength: 3)

                Button("교환 현황 보기") {}
                    .font(.app(10.2, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                    .padding(.horizontal, 11)
                    .frame(height: 31)
                    .background(AppColor.surface, in: Capsule())
                    .overlay(Capsule().stroke(AppColor.border, lineWidth: 1))
            }
        }
        .padding(14)
        .background(AppColor.surface, in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous)
                .stroke(AppColor.gold.opacity(0.32), style: StrokeStyle(lineWidth: 1, dash: [5, 4]))
        )
        .appShadow()
    }
}

private struct QuickActionItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let tint: Color
    var badge: Bool = false
}

struct QuickActionsRow: View {
    private let actions: [QuickActionItem] = [
        .init(icon: "checklist", title: "오늘의 기록", tint: AppColor.mintDark),
        .init(icon: "medal.fill", title: "우표 도감", tint: Color(red: 0.58, green: 0.40, blue: 0.18)),
        .init(icon: "gift.fill", title: "이벤트", tint: AppColor.coral, badge: true),
        .init(icon: "storefront.fill", title: "상점", tint: AppColor.gold)
    ]

    var body: some View {
        HStack(spacing: 6) {
            ForEach(actions) { item in
                Button(action: {}) {
                    HStack(spacing: 4) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: item.icon)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(item.tint)
                            if item.badge {
                                Circle().fill(Color.red).frame(width: 6, height: 6).offset(x: 4, y: -3)
                            }
                        }
                        Text(item.title)
                            .font(.app(9, weight: .semibold))
                            .foregroundStyle(AppColor.ink)
                            .lineLimit(1)
                            .minimumScaleFactor(0.72)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(AppColor.surface, in: RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct BottomTabBar: View {
    private struct Item: Identifiable {
        let id = UUID()
        let icon: String
        let title: String
        var selected = false
        var notification = false
    }

    private let items: [Item] = [
        .init(icon: "house.fill", title: "홈", selected: true),
        .init(icon: "globe.asia.australia", title: "교환"),
        .init(icon: "plus", title: "만들기"),
        .init(icon: "book.closed", title: "기록", notification: true),
        .init(icon: "house", title: "마이룸")
    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                VStack(spacing: 4) {
                    ZStack(alignment: .topTrailing) {
                        if index == 2 {
                            Circle()
                                .fill(AppColor.mint)
                                .frame(width: 48, height: 48)
                                .appShadow(color: AppColor.mint.opacity(0.26), radius: 8, y: 4)
                                .overlay(
                                    Image(systemName: item.icon)
                                        .font(.system(size: 22, weight: .medium))
                                        .foregroundStyle(Color.white)
                                )
                                .offset(y: -9)
                        } else {
                            Image(systemName: item.icon)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(item.selected ? AppColor.mintDark : Color.gray.opacity(0.78))
                        }
                        if item.notification {
                            Circle().fill(Color.red).frame(width: 8, height: 8).offset(x: 8, y: -4)
                        }
                    }
                    .frame(height: 24)
                    Text(item.title)
                        .font(.app(10, weight: item.selected ? .bold : .medium))
                        .foregroundStyle(item.selected ? AppColor.mintDark : AppColor.secondaryInk)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 5)
        .frame(height: AppMetric.tabBarHeight)
        .background(AppColor.tabBar)
        .clipShape(
            UnevenRoundedRectangle(
                cornerRadii: .init(topLeading: 30, bottomLeading: 0, bottomTrailing: 0, topTrailing: 30)
            )
        )
        .overlay(alignment: .top) {
            Rectangle().fill(AppColor.hairline).frame(height: 0.7)
        }
        .appShadow(color: Color.black.opacity(0.10), radius: 12, y: -4)
    }
}
