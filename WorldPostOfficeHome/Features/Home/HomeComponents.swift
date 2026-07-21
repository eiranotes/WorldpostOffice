import SwiftUI

struct UserHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CatAvatarArt()
                .frame(width: 72, height: 72)
                .appShadow(radius: 7, y: 3)

            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 7) {
                    Text("구름 고양이 284")
                        .accessibilityIdentifier("home.profile.alias")
                        .font(.app(20, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineLimit(1)
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(AppColor.mutedInk)
                }

                HStack(spacing: 9) {
                    Text("Lv. 12")
                        .font(.app(14, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                        .padding(.horizontal, 12)
                        .frame(height: 30)
                        .background(AppColor.mint.opacity(0.16), in: Capsule())

                    ProgressView(value: 0.72)
                        .tint(AppColor.mint)
                        .frame(width: 70)

                    Text("720")
                        .font(.app(14, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                    Text("/ 1,000")
                        .font(.app(13))
                        .foregroundStyle(AppColor.secondaryInk)
                        .offset(x: -7)
                }
            }
            .padding(.top, 6)

            Spacer(minLength: 4)

            VStack(alignment: .trailing, spacing: 12) {
                PostOfficeBadge()
                ResourcePill()
            }
        }
    }
}

struct PostOfficeBadge: View {
    var body: some View {
        HStack(spacing: 7) {
            Image(systemName: "globe.asia.australia.fill")
                .font(.system(size: 18))
                .foregroundStyle(AppColor.blue)
            VStack(alignment: .leading, spacing: -1) {
                Text("WORLD")
                Text("POST OFFICE")
            }
            .font(.system(size: 10, weight: .bold, design: .rounded))
            .foregroundStyle(Color(red: 0.62, green: 0.40, blue: 0.24))
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(AppColor.coral.opacity(0.75))
        }
        .padding(.horizontal, 10)
        .frame(height: 48)
        .background(AppColor.surfaceWarm.opacity(0.74), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(AppColor.border.opacity(0.65), style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
        )
    }
}

struct ResourcePill: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "puzzlepiece.fill")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(AppColor.blue)
            Text("우표 조각")
                .font(.app(13, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)
            Text("126")
                .font(.app(15, weight: .bold))
                .foregroundStyle(AppColor.ink)
            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(AppColor.mutedInk)
        }
        .padding(.horizontal, 13)
        .frame(height: 38)
        .background(AppColor.surface, in: Capsule())
        .overlay(Capsule().stroke(AppColor.border.opacity(0.75), lineWidth: 1))
        .appShadow(radius: 6, y: 2)
    }
}

struct GreetingBanner: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 4) {
                Text("안녕하세요,")
                    .font(.app(20, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                Text("오늘도 작은 모험을 시작해볼까요?")
                    .font(.app(19, weight: .medium))
                    .foregroundStyle(AppColor.ink)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 18)

            MascotSceneArt()
                .frame(width: 215, height: 132)
                .allowsHitTesting(false)
                .offset(x: 8, y: 8)
        }
        .frame(height: 150)
    }
}

struct RibbonLabel: View {
    let icon: String
    let title: String
    var color: Color = AppColor.mintDark
    var background: Color = AppColor.mint.opacity(0.15)

    var body: some View {
        HStack(spacing: 7) {
            Image(systemName: icon)
            Text(title)
        }
        .font(.app(17, weight: .bold))
        .foregroundStyle(color)
        .padding(.horizontal, 14)
        .frame(height: 38)
        .background(background, in: UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8, bottomLeading: 8, bottomTrailing: 4, topTrailing: 4)))
    }
}

struct QuestMetaItem: View {
    let icon: String
    let title: String
    let value: String
    var tint: Color

    var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: 5) {
                Image(systemName: icon)
                    .foregroundStyle(tint)
                Text(title)
                    .foregroundStyle(AppColor.secondaryInk)
            }
            .font(.app(11, weight: .medium))
            Text(value)
                .font(.app(14, weight: .bold))
                .foregroundStyle(AppColor.ink)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 68)
        .background(AppColor.surface.opacity(0.92), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
    }
}

struct PrimaryQuestCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            RibbonLabel(icon: "sparkles", title: "오늘의 작은 모험")

            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("창가의 식물을\n물주고 사진 찍기")
                        .font(.app(26, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineSpacing(4)
                    Text("오늘 내 창가의 초록을 기록해요!")
                        .font(.app(15, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                }
                Spacer(minLength: 0)
                PlantPolaroidArt()
                    .frame(width: 142, height: 154)
                    .rotationEffect(.degrees(2.3))
                    .appShadow(radius: 6, y: 3)
                    .offset(y: -10)
            }

            HStack(spacing: 8) {
                QuestMetaItem(icon: "clock", title: "예상 시간", value: "5분 내외", tint: AppColor.mint)
                QuestMetaItem(icon: "camera.fill", title: "결과 유형", value: "사진", tint: AppColor.blue)
                QuestMetaItem(icon: "star.fill", title: "완료 보상", value: "우표 에너지 +20", tint: AppColor.gold)
            }

            Button(action: {}) {
                HStack(spacing: 12) {
                    ZStack {
                        Circle().fill(Color.white.opacity(0.95)).frame(width: 40, height: 40)
                        Image(systemName: "location.north.fill")
                            .foregroundStyle(AppColor.coral)
                    }
                    Spacer()
                    Text("모험 시작하기")
                        .font(.app(22, weight: .bold))
                    Spacer()
                    Color.clear.frame(width: 40, height: 40)
                }
                .foregroundStyle(Color.white)
                .padding(.horizontal, 13)
                .frame(height: 66)
                .background(
                    LinearGradient(
                        colors: [AppColor.coral.opacity(0.88), AppColor.coral],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    in: Capsule()
                )
                .appShadow(color: AppColor.coral.opacity(0.25), radius: 9, y: 5)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("home.quest.start")
        }
        .padding(20)
        .background(AppColor.surfaceMint.opacity(0.87), in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous)
                .stroke(AppColor.mint.opacity(0.24), lineWidth: 1.2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius - 8, style: .continuous)
                .stroke(AppColor.mint.opacity(0.16), style: StrokeStyle(lineWidth: 1, dash: [7, 5]))
                .padding(8)
        )
        .appShadow()
    }
}

struct EnergyProgressCard: View {
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle().fill(AppColor.surfaceWarm).frame(width: 46, height: 46)
                Image(systemName: "bolt.fill")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(AppColor.gold)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("작은 모험을 완료하면 우표 에너지가 쌓여")
                    .font(.app(12, weight: .medium))
                    .foregroundStyle(AppColor.secondaryInk)
                Text("세계 우편 교환이 열려요!")
                    .font(.app(13, weight: .bold))
                    .foregroundStyle(AppColor.mintDark)
            }
            Spacer(minLength: 8)
            VStack(alignment: .leading, spacing: 7) {
                HStack(spacing: 5) {
                    Text("우표 에너지")
                        .font(.app(11, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 12))
                        .foregroundStyle(AppColor.gold)
                    Text("60 / 100")
                        .font(.app(13, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                }
                ProgressView(value: 0.60)
                    .tint(AppColor.mint)
                    .frame(width: 110)
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(AppColor.gold)
        }
        .padding(.horizontal, 14)
        .frame(minHeight: 76)
        .background(AppColor.surfaceWarm.opacity(0.77), in: RoundedRectangle(cornerRadius: 21, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 21).stroke(AppColor.gold.opacity(0.34), lineWidth: 1))
        .appShadow(radius: 7, y: 3)
    }
}

struct ActiveExchangeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            RibbonLabel(icon: "globe.asia.australia.fill", title: "세계 우편", color: Color(red: 0.12, green: 0.37, blue: 0.66), background: AppColor.blue.opacity(0.12))

            Text("현재 교환 진행 중!")
                .accessibilityIdentifier("home.exchange.title")
                .font(.app(22, weight: .bold))
                .foregroundStyle(AppColor.ink)
            Text("익명의 여행자와 함께하는 특별한 교환이에요.")
                .font(.app(13, weight: .medium))
                .foregroundStyle(AppColor.secondaryInk)

            HStack(alignment: .center, spacing: 10) {
                BunnyAvatarArt()
                    .frame(width: 62, height: 62)

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text("바람 토끼 091")
                            .font(.app(15, weight: .bold))
                        Text("🇯🇵")
                            .font(.system(size: 16))
                    }
                    Text("일본 · 도쿄")
                        .font(.app(12, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                }

                Spacer(minLength: 6)

                VStack(spacing: 4) {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 26))
                        .foregroundStyle(AppColor.coral)
                    Text("교환 중")
                        .font(.app(11, weight: .bold))
                        .foregroundStyle(AppColor.blue)
                }

                Image(systemName: "arrow.right")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(AppColor.blue.opacity(0.7))

                TokyoPostcardArt()
                    .frame(width: 116, height: 86)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .rotationEffect(.degrees(2.5))
                    .appShadow(radius: 5, y: 2)
            }

            HStack {
                Label {
                    Text("교환이 완료되면 ") + Text("우표 에너지 +40").foregroundColor(AppColor.mintDark) + Text("을 받을 수 있어요!")
                } icon: {
                    Image(systemName: "clock")
                        .foregroundStyle(AppColor.gold)
                }
                .font(.app(11, weight: .medium))
                Spacer()
                Button("교환 현황 보기") {}
                    .font(.app(12, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                    .padding(.horizontal, 15)
                    .frame(height: 38)
                    .background(AppColor.surface, in: Capsule())
                    .overlay(Capsule().stroke(AppColor.border, lineWidth: 1))
            }
        }
        .padding(18)
        .background(AppColor.surface, in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous)
                .stroke(AppColor.gold.opacity(0.32), style: StrokeStyle(lineWidth: 1, dash: [5, 4]))
        )
        .appShadow()
    }
}

struct QuickAction: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let tint: Color
    var badge: Bool = false
}

struct QuickActionsRow: View {
    private let actions: [QuickAction] = [
        .init(icon: "checklist", title: "오늘의 기록", tint: AppColor.mintDark),
        .init(icon: "medal.fill", title: "우표 도감", tint: Color(red: 0.58, green: 0.40, blue: 0.18)),
        .init(icon: "gift.fill", title: "이벤트", tint: AppColor.coral, badge: true),
        .init(icon: "storefront.fill", title: "상점", tint: AppColor.gold)
    ]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(actions) { item in
                Button(action: {}) {
                    HStack(spacing: 6) {
                        Image(systemName: item.icon)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(item.tint)
                        Text(item.title)
                            .font(.app(11, weight: .semibold))
                            .foregroundStyle(AppColor.ink)
                            .lineLimit(1)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundStyle(AppColor.mutedInk)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(AppColor.surface, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
                    .overlay(alignment: .topTrailing) {
                        if item.badge {
                            Circle().fill(Color.red).frame(width: 8, height: 8).offset(x: -8, y: 6)
                        }
                    }
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
                VStack(spacing: 6) {
                    ZStack(alignment: .topTrailing) {
                        if index == 2 {
                            Circle()
                                .fill(AppColor.mint)
                                .frame(width: 56, height: 56)
                                .appShadow(color: AppColor.mint.opacity(0.26), radius: 8, y: 4)
                                .overlay(
                                    Image(systemName: item.icon)
                                        .font(.system(size: 26, weight: .medium))
                                        .foregroundStyle(Color.white)
                                )
                                .offset(y: -12)
                        } else {
                            Image(systemName: item.icon)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundStyle(item.selected ? AppColor.mintDark : Color.gray.opacity(0.78))
                        }
                        if item.notification {
                            Circle().fill(Color.red).frame(width: 8, height: 8).offset(x: 8, y: -4)
                        }
                    }
                    .frame(height: 28)
                    Text(item.title)
                        .font(.app(11, weight: item.selected ? .bold : .medium))
                        .foregroundStyle(item.selected ? AppColor.mintDark : AppColor.secondaryInk)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.top, 13)
        .padding(.horizontal, 5)
        .frame(height: AppMetric.tabBarHeight)
        .background(AppColor.tabBar)
        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 0, bottomTrailing: 0, topTrailing: 30)))
        .overlay(alignment: .top) {
            Rectangle().fill(AppColor.hairline).frame(height: 0.7)
        }
        .appShadow(color: Color.black.opacity(0.10), radius: 12, y: -4)
    }
}
