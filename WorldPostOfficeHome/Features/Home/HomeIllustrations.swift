import SwiftUI

private struct AssetArt: View {
    let name: String

    var body: some View {
        Image(name, bundle: .main)
            .resizable()
            .interpolation(.high)
            .scaledToFit()
            .accessibilityHidden(true)
    }
}

struct CatAvatarArt: View {
    var body: some View { AssetArt(name: "ProfileCatAvatar") }
}

struct BunnyAvatarArt: View {
    var body: some View { AssetArt(name: "BunnyAvatar") }
}

struct PlantPolaroidArt: View {
    var body: some View { AssetArt(name: "PlantPolaroid") }
}

struct TokyoPostcardArt: View {
    var body: some View { AssetArt(name: "TokyoPostcard") }
}

struct HeartEnvelopeArt: View {
    var body: some View { AssetArt(name: "HeartEnvelope") }
}

struct MascotSceneArt: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack(alignment: .bottomTrailing) {
                AssetArt(name: "PostOfficeScene")
                    .frame(width: size.width * 0.78)
                    .offset(x: size.width * 0.04, y: size.height * 0.04)

                AssetArt(name: "MascotCat")
                    .frame(width: size.width * 0.56)
                    .offset(x: -size.width * 0.30, y: size.height * 0.02)

                HeartEnvelopeArt()
                    .frame(width: size.width * 0.18)
                    .rotationEffect(.degrees(-8))
                    .offset(x: -size.width * 0.60, y: -size.height * 0.42)
            }
            .frame(width: size.width, height: size.height)
        }
        .accessibilityHidden(true)
    }
}
