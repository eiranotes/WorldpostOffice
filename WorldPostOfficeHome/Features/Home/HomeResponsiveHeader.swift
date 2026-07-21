import SwiftUI

struct ResponsiveUserHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 9) {
            CatAvatarArt()
                .frame(width: 64, height: 64)
                .appShadow(radius: 7, y: 3)

            VStack(alignment: .leading, spacing: 9) {
                HStack(spacing: 5) {
                    Text("구름 고양이 284")
                        .accessibilityIdentifier("home.profile.alias")
                        .font(.app(17, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineLimit(1)
                        .minimumScaleFactor(0.78)
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(AppColor.mutedInk)
                }

                HStack(spacing: 6) {
                    Text("Lv. 12")
                        .font(.app(12, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                        .padding(.horizontal, 9)
                        .frame(height: 27)
                        .background(AppColor.mint.opacity(0.16), in: Capsule())

                    ProgressView(value: 0.72)
                        .tint(AppColor.mint)
                        .frame(maxWidth: 58)

                    Text("720 / 1,000")
                        .font(.app(10, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .layoutPriority(1)

            VStack(alignment: .trailing, spacing: 9) {
                CompactPostOfficeBadge()
                CompactResourcePill()
            }
            .frame(width: 118)
        }
    }
}

private struct CompactPostOfficeBadge: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "globe.asia.australia.fill")
                .font(.system(size: 16))
                .foregroundStyle(AppColor.blue)
            VStack(alignment: .leading, spacing: -1) {
                Text("WORLD")
                Text("POST OFFICE")
            }
            .font(.system(size: 8.5, weight: .bold, design: .rounded))
            .foregroundStyle(Color(red: 0.62, green: 0.40, blue: 0.24))
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 7)
        .frame(maxWidth: .infinity)
        .frame(height: 43)
        .background(AppColor.surfaceWarm.opacity(0.74), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(AppColor.border.opacity(0.65), style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
        )
    }
}

private struct CompactResourcePill: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "puzzlepiece.fill")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(AppColor.blue)
            Text("우표 조각")
                .font(.app(10.5, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)
            Text("126")
                .font(.app(12.5, weight: .bold))
                .foregroundStyle(AppColor.ink)
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 35)
        .background(AppColor.surface, in: Capsule())
        .overlay(Capsule().stroke(AppColor.border.opacity(0.75), lineWidth: 1))
        .appShadow(radius: 6, y: 2)
    }
}

struct ResponsiveGreetingBanner: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            VStack(alignment: .leading, spacing: 5) {
                Text("안녕하세요,")
                    .font(.app(19, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                Text("오늘도 작은 모험을\n시작해볼까요?")
                    .font(.app(18, weight: .medium))
                    .foregroundStyle(AppColor.ink)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: 180, alignment: .leading)
            .padding(.bottom, 18)

            Spacer(minLength: 0)

            MascotSceneArt()
                .frame(width: 174, height: 126)
                .allowsHitTesting(false)
                .offset(x: 4, y: 6)
        }
        .frame(height: 142)
    }
}
