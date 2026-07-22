import SwiftUI

struct ResponsiveUserHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            CatAvatarArt()
                .frame(width: 56, height: 56)
                .appShadow(radius: 6, y: 2)

            VStack(alignment: .leading, spacing: 7) {
                HStack(spacing: 4) {
                    Text("구름 고양이 284")
                        .accessibilityIdentifier("home.profile.alias")
                        .font(.app(16.5, weight: .bold))
                        .foregroundStyle(AppColor.ink)
                        .lineLimit(1)
                        .minimumScaleFactor(0.82)
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(AppColor.mutedInk)
                }

                HStack(spacing: 5) {
                    Text("Lv. 12")
                        .font(.app(11.5, weight: .bold))
                        .foregroundStyle(AppColor.mintDark)
                        .padding(.horizontal, 8)
                        .frame(height: 25)
                        .background(AppColor.mint.opacity(0.16), in: Capsule())

                    ProgressView(value: 0.72)
                        .tint(AppColor.mint)
                        .frame(maxWidth: 52)

                    Text("720 / 1,000")
                        .font(.app(9.5, weight: .semibold))
                        .foregroundStyle(AppColor.secondaryInk)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 2)
            .layoutPriority(1)

            VStack(alignment: .trailing, spacing: 7) {
                CompactPostOfficeBadge()
                CompactResourcePill()
            }
            .frame(width: 108)
        }
        .frame(minHeight: 68)
    }
}

private struct CompactPostOfficeBadge: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "globe.asia.australia.fill")
                .font(.system(size: 14))
                .foregroundStyle(AppColor.blue)
            VStack(alignment: .leading, spacing: -1) {
                Text("WORLD")
                Text("POST OFFICE")
            }
            .font(.system(size: 7.8, weight: .bold, design: .rounded))
            .foregroundStyle(Color(red: 0.62, green: 0.40, blue: 0.24))
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 7)
        .frame(maxWidth: .infinity)
        .frame(height: 38)
        .background(AppColor.surfaceWarm.opacity(0.74), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(AppColor.border.opacity(0.65), style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
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
                .font(.app(9.8, weight: .semibold))
                .foregroundStyle(AppColor.secondaryInk)
            Text("126")
                .font(.app(11.5, weight: .bold))
                .foregroundStyle(AppColor.ink)
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 31)
        .background(AppColor.surface, in: Capsule())
        .overlay(Capsule().stroke(AppColor.border.opacity(0.75), lineWidth: 1))
        .appShadow(radius: 5, y: 2)
    }
}

struct ResponsiveGreetingBanner: View {
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            VStack(alignment: .leading, spacing: 3) {
                Text("안녕하세요,")
                    .font(.app(17.5, weight: .bold))
                    .foregroundStyle(AppColor.ink)
                Text("오늘도 작은 모험을\n시작해볼까요?")
                    .font(.app(15.5, weight: .medium))
                    .foregroundStyle(AppColor.ink)
                    .lineSpacing(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(width: 158, alignment: .leading)

            Spacer(minLength: 0)

            MascotSceneArt()
                .frame(width: 172, height: 96)
                .allowsHitTesting(false)
        }
        .frame(height: 98)
    }
}
