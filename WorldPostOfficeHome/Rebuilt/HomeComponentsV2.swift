import SwiftUI

struct UserHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 9) {
            ProfileCatArt()
                .frame(width: 59, height: 59)
                .softShadow(radius: 5, y: 2)

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    Text("구름 고양이 284")
                        .accessibilityIdentifier("home.profile.alias")
                        .font(.app(17, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineLimit(1)
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(AppColor.mutedInk)
                }

                HStack(spacing: 6) {
                    Text("Lv. 12")
                        .font(.app(11.5, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                        .padding(.horizontal, 9)
                        .frame(height: 27)
                        .background(AppColor.mint.opacity(0.14), in: Capsule())

                    GeometryReader { proxy in
                        ZStack(alignment: .leading) {
                            Capsule().fill(AppColor.border.opacity(0.45))
                            Capsule().fill(AppColor.mint).frame(width: proxy.size.width * 0.72)
                        }
                    }
                    .frame(width: 65, height: 7)

                    Text("720 / 1,000")
                        .font(.app(9.5, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)

            VStack(alignment: .trailing, spacing: 8) {
                PostOfficeBadge()
                ResourcePill()
            }
            .frame(width: 118)
        }
        .frame(minHeight: 69)
    }
}

private struct PostOfficeBadge: View {
    var body: some View {
        HStack(spacing: 5) {
            ZStack {
                Circle().fill(AppColor.blue.opacity(0.12))
                Image(systemName: "globe.asia.australia.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(AppColor.blue)
            }
            .frame(width: 25, height: 25)

            VStack(alignment: .leading, spacing: -1) {
                Text("WORLD")
                Text("POST OFFICE")
            }
            .font(.system(size: 8.6, weight: .bold, design: .rounded))
            .foregroundStyle(Color(red: 0.63, green: 0.40, blue: 0.23))
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, minHeight: 43)
        .background(AppColor.warmSurface.opacity(0.8), in: RoundedRectangle(cornerRadius: 9, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 9).stroke(AppColor.border.opacity(0.7), style: StrokeStyle(lineWidth: 1, dash: [3, 3])))
    }
}

private struct ResourcePill: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "puzzlepiece.fill")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(AppColor.blue)
            Text("우표 조각")
                .font(.app(9.7, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)
            Text("126")
                .font(.app(12, weight: .bold))
                .foregroundStyle(AppColor.ink)
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 9, weight: .bold))
                .foregroundStyle(AppColor.mutedInk)
        }
        .padding(.horizontal, 9)
        .frame(maxWidth: .infinity, minHeight: 34)
        .background(AppColor.surface, in: Capsule())
        .overlay(Capsule().stroke(AppColor.border.opacity(0.8), lineWidth: 1))
        .softShadow(radius: 4, y: 2)
    }
}

struct GreetingBanner: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 5) {
                Text("안녕하세요,")
                    .font(.app(18, weight: .bold))
                Text("오늘도 작은 모험을\n시작해볼까요?")
                    .font(.app(16, weight: .medium))
                    .lineSpacing(2)
            }
            .foregroundStyle(AppColor.ink)
            .frame(width: 155, alignment: .leading)

            Spacer(minLength: 0)

            HeroSceneArt()
                .frame(width: 202, height: 102)
                .offset(y: 4)
                .allowsHitTesting(false)
        }
        .frame(height: 105)
    }
}

private struct RibbonLabel: View {
    let icon: String
    let title: String
    var tint: Color = AppColor.mintDark
    var fill: Color = AppColor.mint.opacity(0.14)

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
            Text(title)
        }
        .font(.app(13.5, weight: .bold))
        .foregroundStyle(tint)
        .padding(.horizontal, 12)
        .frame(height: 28)
        .background(
            fill,
            in: UnevenRoundedRectangle(
                cornerRadii: .init(topLeading: 7, bottomLeading: 7, bottomTrailing: 3, topTrailing: 3)
            )
        )
    }
}

private struct QuestMetaItem: View {
    let icon: String
    let title: String
    let value: String
    let tint: Color

    var body: some View {
        VStack(spacing: 2) {
            HStack(spacing: 3) {
                Image(systemName: icon).foregroundStyle(tint)
                Text(title).foregroundStyle(AppColor.secondaryInk)
            }
            .font(.app(8.8, weight: .medium))

            Text(value)
                .font(.app(10.8, weight: .bold))
                .foregroundStyle(AppColor.ink)
                .lineLimit(1)
                .minimumScaleFactor(0.72)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .background(AppColor.surface.opacity(0.94), in: RoundedRectangle(cornerRadius: 11, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 11).stroke(AppColor.border.opacity(0.65), lineWidth: 1))
    }
}

struct PrimaryQuestCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RibbonLabel(icon: "sparkles", title: "오늘의 작은 모험")

            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("창가의 식물을\n물주고 사진 찍기")
                        .font(.app(18.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineSpacing(2)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("오늘 내 창가의 초록을 기록해요!")
                        .font(.app(11.4, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)

                PlantPolaroidArt()
                    .frame(width: 122, height: 104)
                    .rotationEffect(.degrees(3))
                    .softShadow(radius: 5, y: 2)
            }
            .frame(height: 105)

            HStack(spacing: 6) {
                QuestMetaItem(icon: "clock", title: "예상 시간", value: "5분 내외", tint: AppColor.mint)
                QuestMetaItem(icon: "camera.fill", title: "결과 유형", value: "사진", tint: AppColor.blue)
                QuestMetaItem(icon: "star.fill", title: "완료 보상", value: "우표 에너지 +20", tint: AppColor.gold)
            }

            Button(action: {}) {
                HStack(spacing: 8) {
                    ZStack {
                        Circle().fill(Color.white.opacity(0.95)).frame(width: 31, height: 31)
                        Image(systemName: "location.north.fill")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(AppColor.coral)
                    }
                    Spacer()
                    Text("모험 시작하기")
                        .font(.app(17, weight: .bold))
                    Spacer()
                    Color.clear.frame(width: 31, height: 31)
                }
                .foregroundStyle(Color.white)
                .padding(.horizontal, 10)
                .frame(height: 46)
                .background(AppColor.coral, in: Capsule())
                .softShadow(radius: 6, y: 3)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("home.quest.start")
        }
        .padding(13)
        .background(AppColor.mintSurface.opacity(0.90), in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: AppMetric.cardRadius).stroke(AppColor.mint.opacity(0.23), lineWidth: 1.2))
        .overlay(
            RoundedRectangle(cornerRadius: AppMetric.cardRadius - 8)
                .stroke(AppColor.mint.opacity(0.15), style: StrokeStyle(lineWidth: 1, dash: [7, 5]))
                .padding(7)
        )
        .softShadow()
    }
}

struct EnergyProgressCard: View {
    var body: some View {
        HStack(spacing: 8) {
            EnergyStampArt()
                .frame(width: 42, height: 42)

            VStack(alignment: .leading, spacing: 1) {
                Text("작은 모험을 완료하면 우표 에너지가 쌓여")
                    .font(.app(9.5, weight: .medium))
                    .foregroundStyle(AppColor.secondaryInk)
                    .lineLimit(1)
                Text("세계 우편 교환이 열려요!")
                    .font(.app(10.8, weight: .bold))
                    .foregroundStyle(AppColor.mintDark)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 3) {
                    Text("우표 에너지")
                        .font(.app(9.2, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 9))
                        .foregroundStyle(AppColor.gold)
                    Text("60 / 100")
                        .font(.app(10.8, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                }
                GeometryReader { proxy in
                    ZStack(alignment: .leading) {
                        Capsule().fill(AppColor.border.opacity(0.42))
                        Capsule().fill(AppColor.mint).frame(width: proxy.size.width * 0.60)
                    }
                }
                .frame(height: 8)
            }
            .frame(width: 108)

            Image(systemName: "chevron.right")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(AppColor.gold)
        }
        .padding(.horizontal, 10)
        .frame(height: 57)
        .background(AppColor.warmSurface.opacity(0.90), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(AppColor.gold.opacity(0.32), lineWidth: 1))
        .softShadow(radius: 5, y: 2)
    }
}

struct ActiveExchangeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            RibbonLabel(
                icon: "globe.asia.australia.fill",
                title: "세계 우편",
                tint: Color(red: 0.12, green: 0.37, blue: 0.66),
                fill: AppColor.blue.opacity(0.12)
            )

            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("현재 교환 진행 중!")
                        .accessibilityIdentifier("home.exchange.title")
                        .font(.app(17, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                    Text("익명의 여행자와 함께하는 특별한 교환이에요.")
                        .font(.app(9.8, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                }
                Spacer(minLength: 5)
                Text("D-3")
                    .font(.app(10, weight: .bold))
                    .foregroundStyle(AppColor.blue)
                    .padding(.horizontal, 8)
                    .frame(height: 23)
                    .background(AppColor.blueSurface, in: Capsule())
            }

            HStack(spacing: 7) {
                BunnyAvatarArt().frame(width: 47, height: 47)

                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Text("바람 토끼 091")
                            .font(.app(11.5, weight: .bold))
                        Text("🇯🇵").font(.system(size: 12))
                    }
                    Text("일본 · 도쿄")
                        .font(.app(9.5, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                ZStack {
                    Capsule()
                        .stroke(AppColor.blue.opacity(0.38), style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
                        .frame(width: 48, height: 1)
                    HeartEnvelopeArt()
                        .frame(width: 29, height: 29)
                }
                .frame(width: 48, height: 30)

                TokyoPostcardArt()
                    .frame(width: 96, height: 67)
                    .rotationEffect(.degrees(2))
                    .softShadow(radius: 4, y: 2)
            }

            HStack(spacing: 6) {
                Label {
                    Text("완료 시 우표 에너지 +40")
                } icon: {
                    Image(systemName: "clock")
                        .foregroundStyle(AppColor.gold)
                }
                .font(.app(9.4, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)

                Spacer(minLength: 3)

                Button("교환 현황 보기") {}
                    .font(.app(10, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                    .padding(.horizontal, 10)
                    .frame(height: 30)
                    .background(AppColor.surface, in: Capsule())
                    .overlay(Capsule().stroke(AppColor.border, lineWidth: 1))
            }
        }
        .padding(12)
        .background(AppColor.surface, in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: AppMetric.cardRadius).stroke(AppColor.gold.opacity(0.30), style: StrokeStyle(lineWidth: 1, dash: [5, 4])))
        .softShadow()
    }
}

private struct QuickActionItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let badge: Bool
}

struct QuickActionsRow: View {
    private let actions: [QuickActionItem] = [
        .init(title: "오늘의 기록", imageName: "QuickChecklist", badge: false),
        .init(title: "우표 도감", imageName: "QuickStampAlbum", badge: false),
        .init(title: "이벤트", imageName: "QuickGift", badge: true),
        .init(title: "상점", imageName: "QuickShop", badge: false)
    ]

    var body: some View {
        HStack(spacing: 6) {
            ForEach(actions) { item in
                Button(action: {}) {
                    HStack(spacing: 4) {
                        ZStack(alignment: .topTrailing) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                            if item.badge {
                                Circle().fill(Color.red).frame(width: 7, height: 7).offset(x: 2, y: -2)
                            }
                        }
                        Text(item.title)
                            .font(.app(9.3, weight: .semibold))
                            .foregroundStyle(AppColor.ink)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundStyle(AppColor.mutedInk)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(AppColor.surface, in: RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct TabItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let active: Bool
    let badge: Bool
}

struct BottomTabBar: View {
    private let tabs: [TabItem] = [
        .init(icon: "house.fill", title: "홈", active: true, badge: false),
        .init(icon: "globe.asia.australia", title: "교환", active: false, badge: false),
        .init(icon: "plus", title: "만들기", active: false, badge: false),
        .init(icon: "book.closed", title: "기록", active: false, badge: true),
        .init(icon: "house", title: "마이룸", active: false, badge: false)
    ]

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
                if index == 2 {
                    VStack(spacing: 2) {
                        ZStack {
                            Circle().fill(AppColor.mint)
                                .frame(width: 58, height: 58)
                                .softShadow(radius: 7, y: 3)
                            Image(systemName: tab.icon)
                                .font(.system(size: 28, weight: .medium))
                                .foregroundStyle(Color.white)
                        }
                        Text(tab.title)
                            .font(.app(10, weight: .semibold))
                            .foregroundStyle(AppColor.secondaryInk)
                    }
                    .offset(y: -12)
                    .frame(maxWidth: .infinity)
                } else {
                    VStack(spacing: 3) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: tab.icon)
                                .font(.system(size: 22, weight: .semibold))
                            if tab.badge {
                                Circle().fill(Color.red).frame(width: 7, height: 7).offset(x: 4, y: -2)
                            }
                        }
                        Text(tab.title)
                            .font(.app(10, weight: tab.active ? .bold : .medium))
                    }
                    .foregroundStyle(tab.active ? AppColor.mintDark : AppColor.secondaryInk)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 7)
        .frame(height: AppMetric.tabHeight)
        .background(AppColor.surface)
        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 28, bottomLeading: 0, bottomTrailing: 0, topTrailing: 28)))
        .overlay(alignment: .top) { Rectangle().fill(AppColor.border.opacity(0.55)).frame(height: 1) }
        .softShadow(radius: 12, y: -2)
    }
}
