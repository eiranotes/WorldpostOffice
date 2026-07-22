import SwiftUI

private struct AssetImageV3: View {
    let name: String

    var body: some View {
        Image(name, bundle: .main)
            .resizable()
            .interpolation(.high)
            .scaledToFit()
            .accessibilityHidden(true)
    }
}

private struct UserHeaderV3: View {
    var body: some View {
        HStack(alignment: .top, spacing: 9) {
            AssetImageV3(name: "ProfileCatAvatar")
                .frame(width: 67, height: 67)
                .softShadow(radius: 5, y: 2)

            VStack(alignment: .leading, spacing: 7) {
                HStack(spacing: 4) {
                    Text("구름 고양이 284")
                        .accessibilityIdentifier("home.profile.alias")
                        .font(.app(17, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineLimit(1)
                        .minimumScaleFactor(0.86)
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(AppColor.mutedInk)
                }

                HStack(spacing: 6) {
                    Text("Lv. 12")
                        .font(.app(11.5, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                        .padding(.horizontal, 9)
                        .frame(height: 26)
                        .background(AppColor.mint.opacity(0.14), in: Capsule())

                    GeometryReader { proxy in
                        ZStack(alignment: .leading) {
                            Capsule().fill(AppColor.border.opacity(0.45))
                            Capsule().fill(AppColor.mint).frame(width: proxy.size.width * 0.72)
                        }
                    }
                    .frame(width: 62, height: 7)

                    Text("720 / 1,000")
                        .font(.app(9.4, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                        .minimumScaleFactor(0.72)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
            .layoutPriority(1)

            VStack(alignment: .trailing, spacing: 6) {
                HStack(spacing: 5) {
                    ZStack {
                        Circle().fill(AppColor.blue.opacity(0.13))
                        Image(systemName: "globe.asia.australia.fill")
                            .font(.system(size: 15))
                            .foregroundStyle(AppColor.blue)
                    }
                    .frame(width: 24, height: 24)

                    VStack(alignment: .leading, spacing: -1) {
                        Text("WORLD")
                        Text("POST OFFICE")
                    }
                    .font(.system(size: 8.2, weight: .bold, design: .rounded))
                    .foregroundStyle(Color(red: 0.63, green: 0.40, blue: 0.23))
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 8)
                .frame(width: 116, height: 42)
                .background(AppColor.warmSurface.opacity(0.78), in: RoundedRectangle(cornerRadius: 9, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 9).stroke(AppColor.border.opacity(0.72), style: StrokeStyle(lineWidth: 1, dash: [3, 3])))

                HStack(spacing: 5) {
                    Image(systemName: "puzzlepiece.fill")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(AppColor.blue)
                    Text("우표 조각")
                        .font(.app(9.4, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                    Text("126")
                        .font(.app(11.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundStyle(AppColor.mutedInk)
                }
                .padding(.horizontal, 8)
                .frame(width: 116, height: 32)
                .background(AppColor.surface, in: Capsule())
                .overlay(Capsule().stroke(AppColor.border.opacity(0.78), lineWidth: 1))
                .softShadow(radius: 4, y: 2)
            }
        }
        .frame(height: 78)
    }
}

private struct GreetingBannerV3: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("안녕하세요,")
                    .font(.app(17.5, weight: .bold))
                Text("오늘도 작은 모험을\n시작해볼까요?")
                    .font(.app(15.2, weight: .medium))
                    .lineSpacing(2)
            }
            .foregroundStyle(AppColor.ink)
            .frame(width: 146, alignment: .leading)

            Spacer(minLength: 0)

            AssetImageV3(name: "HeroScene")
                .frame(width: 218, height: 94)
                .offset(x: 4, y: 3)
        }
        .frame(height: 95)
    }
}

private struct RibbonV3: View {
    let icon: String
    let title: String
    var tint: Color = AppColor.mintDark
    var fill: Color = AppColor.mint.opacity(0.14)

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
            Text(title)
        }
        .font(.app(13.3, weight: .bold))
        .foregroundStyle(tint)
        .padding(.horizontal, 11)
        .frame(height: 27)
        .background(fill, in: UnevenRoundedRectangle(cornerRadii: .init(topLeading: 7, bottomLeading: 7, bottomTrailing: 3, topTrailing: 3)))
    }
}

private struct QuestMetaV3: View {
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
            .font(.app(8.5, weight: .medium))

            Text(value)
                .font(.app(10.5, weight: .bold))
                .foregroundStyle(AppColor.ink)
                .lineLimit(1)
                .minimumScaleFactor(0.68)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 42)
        .background(AppColor.surface.opacity(0.96), in: RoundedRectangle(cornerRadius: 11, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 11).stroke(AppColor.border.opacity(0.65), lineWidth: 1))
    }
}

private struct PrimaryQuestCardV3: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            RibbonV3(icon: "sparkles", title: "오늘의 작은 모험")

            HStack(alignment: .center, spacing: 4) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("창가의 식물을\n물주고 사진 찍기")
                        .font(.app(18.2, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineSpacing(1)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("오늘 내 창가의 초록을 기록해요!")
                        .font(.app(10.8, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)

                AssetImageV3(name: "PlantPolaroid")
                    .frame(width: 121, height: 112)
                    .rotationEffect(.degrees(2.5))
                    .softShadow(radius: 5, y: 2)
            }
            .frame(height: 105)

            HStack(spacing: 6) {
                QuestMetaV3(icon: "clock", title: "예상 시간", value: "5분 내외", tint: AppColor.mint)
                QuestMetaV3(icon: "camera.fill", title: "결과 유형", value: "사진", tint: AppColor.blue)
                QuestMetaV3(icon: "star.fill", title: "완료 보상", value: "우표 에너지 +20", tint: AppColor.gold)
            }

            Button(action: {}) {
                HStack(spacing: 8) {
                    ZStack {
                        Circle().fill(Color.white.opacity(0.96)).frame(width: 30, height: 30)
                        Image(systemName: "location.north.fill")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(AppColor.coral)
                    }
                    Spacer()
                    Text("모험 시작하기")
                        .font(.app(16.5, weight: .bold))
                    Spacer()
                    Color.clear.frame(width: 30, height: 30)
                }
                .foregroundStyle(Color.white)
                .padding(.horizontal, 10)
                .frame(height: 44)
                .background(AppColor.coral, in: Capsule())
                .softShadow(radius: 6, y: 3)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("home.quest.start")
        }
        .padding(11)
        .background(AppColor.mintSurface.opacity(0.90), in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: AppMetric.cardRadius).stroke(AppColor.mint.opacity(0.23), lineWidth: 1.2))
        .overlay(RoundedRectangle(cornerRadius: AppMetric.cardRadius - 8).stroke(AppColor.mint.opacity(0.15), style: StrokeStyle(lineWidth: 1, dash: [7, 5])).padding(7))
        .softShadow()
    }
}

private struct EnergyCardV3: View {
    var body: some View {
        HStack(spacing: 8) {
            AssetImageV3(name: "EnergyStamp")
                .frame(width: 43, height: 43)
                .rotationEffect(.degrees(-4))

            VStack(alignment: .leading, spacing: 1) {
                Text("작은 모험을 완료하면 우표 에너지가 쌓여")
                    .font(.app(9.1, weight: .medium))
                    .foregroundStyle(AppColor.secondaryInk)
                    .lineLimit(1)
                    .minimumScaleFactor(0.78)
                Text("세계 우편 교환이 열려요!")
                    .font(.app(10.5, weight: .bold))
                    .foregroundStyle(AppColor.mintDark)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 3) {
                    Text("우표 에너지")
                        .font(.app(8.9, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 8))
                        .foregroundStyle(AppColor.gold)
                    Text("60 / 100")
                        .font(.app(10.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                }
                GeometryReader { proxy in
                    ZStack(alignment: .leading) {
                        Capsule().fill(AppColor.border.opacity(0.42))
                        Capsule().fill(AppColor.mint).frame(width: proxy.size.width * 0.60)
                    }
                }
                .frame(height: 7)
            }
            .frame(width: 105)

            Image(systemName: "chevron.right")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(AppColor.gold)
        }
        .padding(.horizontal, 10)
        .frame(height: 54)
        .background(AppColor.warmSurface.opacity(0.90), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(AppColor.gold.opacity(0.32), lineWidth: 1))
        .softShadow(radius: 5, y: 2)
    }
}

private struct ExchangeCardV3: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            RibbonV3(icon: "globe.asia.australia.fill", title: "세계 우편", tint: Color(red: 0.12, green: 0.37, blue: 0.66), fill: AppColor.blue.opacity(0.12))

            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 1) {
                    Text("현재 교환 진행 중!")
                        .accessibilityIdentifier("home.exchange.title")
                        .font(.app(16.2, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                    Text("익명의 여행자와 함께하는 특별한 교환이에요.")
                        .font(.app(9.2, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                        .minimumScaleFactor(0.78)
                }
                Spacer(minLength: 4)
                Text("D-3")
                    .font(.app(9.8, weight: .bold))
                    .foregroundStyle(AppColor.blue)
                    .padding(.horizontal, 8)
                    .frame(height: 22)
                    .background(AppColor.blueSurface, in: Capsule())
            }

            HStack(spacing: 6) {
                AssetImageV3(name: "BunnyAvatar")
                    .frame(width: 47, height: 47)

                VStack(alignment: .leading, spacing: 1) {
                    HStack(spacing: 4) {
                        Text("바람 토끼 091")
                            .font(.app(11.2, weight: .bold))
                        Text("🇯🇵").font(.system(size: 11))
                    }
                    Text("일본 · 도쿄")
                        .font(.app(9.2, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                ZStack {
                    Capsule()
                        .stroke(AppColor.blue.opacity(0.38), style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
                        .frame(width: 44, height: 1)
                    AssetImageV3(name: "HeartEnvelope")
                        .frame(width: 28, height: 28)
                }
                .frame(width: 44, height: 28)

                AssetImageV3(name: "TokyoPostcard")
                    .frame(width: 100, height: 72)
                    .rotationEffect(.degrees(2))
                    .softShadow(radius: 4, y: 2)
            }
            .frame(height: 72)

            HStack(spacing: 5) {
                Label {
                    Text("완료 시 우표 에너지 +40")
                } icon: {
                    Image(systemName: "clock").foregroundStyle(AppColor.gold)
                }
                .font(.app(9.1, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)

                Spacer(minLength: 3)

                Button("교환 현황 보기") {}
                    .font(.app(9.7, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                    .padding(.horizontal, 10)
                    .frame(height: 28)
                    .background(AppColor.surface, in: Capsule())
                    .overlay(Capsule().stroke(AppColor.border, lineWidth: 1))
            }
        }
        .padding(10)
        .background(AppColor.surface, in: RoundedRectangle(cornerRadius: AppMetric.cardRadius, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: AppMetric.cardRadius).stroke(AppColor.gold.opacity(0.30), style: StrokeStyle(lineWidth: 1, dash: [5, 4])))
        .softShadow()
    }
}

private struct QuickActionV3: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let badge: Bool
}

private struct QuickActionsRowV3: View {
    private let actions: [QuickActionV3] = [
        .init(title: "오늘의 기록", imageName: "QuickChecklist", badge: false),
        .init(title: "우표 도감", imageName: "QuickStampAlbum", badge: false),
        .init(title: "이벤트", imageName: "QuickGift", badge: true),
        .init(title: "상점", imageName: "QuickShop", badge: false)
    ]

    var body: some View {
        HStack(spacing: 6) {
            ForEach(actions) { item in
                Button(action: {}) {
                    HStack(spacing: 3) {
                        ZStack(alignment: .topTrailing) {
                            AssetImageV3(name: item.imageName)
                                .frame(width: 25, height: 25)
                            if item.badge {
                                Circle().fill(Color.red).frame(width: 7, height: 7).offset(x: 2, y: -2)
                            }
                        }
                        Text(item.title)
                            .font(.app(8.9, weight: .semibold))
                            .foregroundStyle(AppColor.ink)
                            .lineLimit(1)
                            .minimumScaleFactor(0.72)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundStyle(AppColor.mutedInk)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 43)
                    .background(AppColor.surface, in: RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct BottomTabBarV3: View {
    private let tabs: [(String, String, Bool, Bool)] = [
        ("house.fill", "홈", true, false),
        ("globe.asia.australia", "교환", false, false),
        ("plus", "만들기", false, false),
        ("book.closed", "기록", false, true),
        ("house", "마이룸", false, false)
    ]

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                if index == 2 {
                    VStack(spacing: 1) {
                        ZStack {
                            Circle().fill(AppColor.mint)
                                .frame(width: 56, height: 56)
                                .softShadow(radius: 7, y: 3)
                            Image(systemName: tab.0)
                                .font(.system(size: 27, weight: .medium))
                                .foregroundStyle(Color.white)
                        }
                        Text(tab.1)
                            .font(.app(9.5, weight: .semibold))
                            .foregroundStyle(AppColor.secondaryInk)
                    }
                    .offset(y: -10)
                    .frame(maxWidth: .infinity)
                } else {
                    VStack(spacing: 2) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: tab.0)
                                .font(.system(size: 21, weight: .semibold))
                            if tab.3 {
                                Circle().fill(Color.red).frame(width: 7, height: 7).offset(x: 4, y: -2)
                            }
                        }
                        Text(tab.1)
                            .font(.app(9.5, weight: tab.2 ? .bold : .medium))
                    }
                    .foregroundStyle(tab.2 ? AppColor.mintDark : AppColor.secondaryInk)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 6)
        .frame(height: AppMetric.tabHeight)
        .background(AppColor.surface)
        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 28, bottomLeading: 0, bottomTrailing: 0, topTrailing: 28)))
        .overlay(alignment: .top) { Rectangle().fill(AppColor.border.opacity(0.55)).frame(height: 1) }
        .softShadow(radius: 12, y: -2)
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 7) {
                    UserHeaderV3()
                    GreetingBannerV3()
                    PrimaryQuestCardV3()
                    EnergyCardV3()
                    ExchangeCardV3()
                    QuickActionsRowV3()
                }
                .padding(.horizontal, AppMetric.horizontal)
                .padding(.top, 4)
                .padding(.bottom, 7)
                .frame(maxWidth: 430)
                .frame(maxWidth: .infinity)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomTabBarV3()
        }
    }
}

#Preview("Home V3") {
    HomeView()
        .previewDevice("iPhone 16 Pro")
}
