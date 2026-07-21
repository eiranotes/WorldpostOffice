import SwiftUI

private struct HomeAssetImage: View {
    let name: String
    var contentMode: ContentMode = .fit

    var body: some View {
        Image(name)
            .resizable()
            .interpolation(.high)
            .antialiased(true)
            .aspectRatio(contentMode: contentMode)
            .accessibilityHidden(true)
    }
}

struct CatAvatarArt: View {
    var body: some View {
        HomeAssetImage(name: "ProfileCatAvatar")
    }
}

struct BunnyAvatarArt: View {
    var body: some View {
        HomeAssetImage(name: "TravelerRabbitAvatar")
    }
}

struct MascotSceneArt: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack(alignment: .bottomTrailing) {
                HStack(alignment: .bottom, spacing: -8) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(index == 1 ? AppColor.mint.opacity(0.20) : AppColor.gold.opacity(0.12))
                            .frame(width: size.width * (index == 1 ? 0.32 : 0.25))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(y: size.height * 0.16)

                RoundedRectangle(cornerRadius: size.width * 0.035, style: .continuous)
                    .fill(AppColor.surfaceWarm.opacity(0.92))
                    .frame(width: size.width * 0.28, height: size.height * 0.43)
                    .overlay(alignment: .top) {
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: size.width * 0.04,
                                bottomLeading: 0,
                                bottomTrailing: 0,
                                topTrailing: size.width * 0.04
                            )
                        )
                        .fill(AppColor.coral.opacity(0.72))
                        .frame(height: size.height * 0.12)
                        .offset(y: -size.height * 0.06)
                    }
                    .overlay {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: max(10, size.width * 0.07), weight: .bold))
                            .foregroundStyle(AppColor.coral)
                    }
                    .offset(x: -size.width * 0.03, y: size.height * 0.10)

                HomeAssetImage(name: "MascotPostman")
                    .frame(width: size.width * 0.58, height: size.height * 1.05)
                    .offset(x: -size.width * 0.28, y: size.height * 0.03)

                HomeAssetImage(name: "HeartEnvelope")
                    .frame(width: size.width * 0.20, height: size.width * 0.20)
                    .offset(x: -size.width * 0.68, y: -size.height * 0.50)
            }
            .frame(width: size.width, height: size.height)
            .clipped()
        }
        .accessibilityHidden(true)
    }
}

struct PlantPolaroidArt: View {
    var body: some View {
        HomeAssetImage(name: "PlantPolaroid")
    }
}

struct TokyoPostcardArt: View {
    var body: some View {
        HomeAssetImage(name: "TokyoPostcard")
    }
}
