import SwiftUI

struct ResponsiveUserHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            CatAvatarArt()
                .frame(width: 60, height: 60)
                .appShadow(radius: 6, y: 2)

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    Text("구름 고양이 284")
                        .accessibilityIdentifier("home.profile.alias")
                        .font(.app(17.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineLimit(1)
                        .minimumScaleFactor(0.84)
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(AppColor.mutedInk)
                }

                HStack(spacing: 5) {
                    Text("Lv. 12")
                        .font(.app(12, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                        .padding(.horizontal, 9)
                        .frame(height: 26)
                        .background(AppColor.mint.opacity(0.16), in: Capsule())

                    ProgressView(value: 0.72)
                        .tint(AppColor.mint)
                        .frame(width: 52)

                    Text("720")
                        .font(.app(11.2, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                    Text("/ 1,000")
                        .font(.app(10.2, weight: .medium))
                        .foregroundStyle(AppColor.secondaryInk)
                        .offset(x: -3)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 3)
            .layoutPriority(1)

            VStack(alignment: .trailing, spacing: 7) {
                CompactPostOfficeBadge()
                CompactResourcePill()
            }
            .frame(width: 116)
        }
        .frame(minHeight: 70)
    }
}

private struct CompactPostOfficeBadge: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "globe.asia.australia.fill")
                .font(.system(size: 15))
                .foregroundStyle(AppColor.blue)
            VStack(alignment: .leading, spacing: -1) {
                Text("WORLD")
                Text("POST OFFICE")
            }
            .font(.system(size: 8.1, weight: .bold, design: .rounded))
            .foregroundStyle(Color(red: 0.62, green: 0.40, blue: 0.24))
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(AppColor.surfaceWarm.opacity(0.76), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(AppColor.border.opacity(0.68), style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
        )
    }
}

private struct CompactResourcePill: View {
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "puzzlepiece.fill")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(AppColor.blue)
            Text("우표 조각")
                .font(.app(10.2, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)
            Text("126")
                .font(.app(12, weight: .bold))
                .foregroundStyle(AppColor.ink)
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 8, weight: .bold))
                .foregroundStyle(AppColor.mutedInk)
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 32)
        .background(AppColor.surface, in: Capsule())
        .overlay(Capsule().stroke(AppColor.border.opacity(0.76), lineWidth: 1))
        .appShadow(radius: 5, y: 2)
    }
}

struct ResponsiveGreetingBanner: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("안녕하세요,")
                        .font(.app(18.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                    Text("오늘도 작은 모험을\n시작해볼까요?")
                        .font(.app(15.7, weight: .medium))
                        .foregroundStyle(AppColor.ink)
                        .lineSpacing(2)
                }
                .frame(width: min(175, width * 0.47), alignment: .leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.top, 18)

                HeroSceneArt()
                    .frame(width: min(225, width * 0.59), height: 110)
                    .offset(x: 7, y: 2)

                HeartEnvelopeArt()
                    .frame(width: 34, height: 34)
                    .rotationEffect(.degrees(-8))
                    .position(x: width * 0.49, y: 25)
            }
        }
        .frame(height: 112)
        .clipped()
    }
}
