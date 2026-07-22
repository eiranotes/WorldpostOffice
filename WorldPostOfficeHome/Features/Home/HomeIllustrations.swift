import SwiftUI

private struct AssetArt: View {
    let name: String
    var contentMode: ContentMode = .fit

    var body: some View {
        Image(name, bundle: .main)
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .interpolation(.high)
            .accessibilityHidden(true)
    }
}

struct CatAvatarArt: View {
    var body: some View { AssetArt(name: "ProfileCatAvatar") }
}

struct BunnyAvatarArt: View {
    var body: some View { AssetArt(name: "TravelerRabbitAvatar") }
}

struct HeroSceneArt: View {
    var body: some View { AssetArt(name: "HomeHeroScene") }
}

struct HeartEnvelopeArt: View {
    var body: some View { AssetArt(name: "HeartEnvelope") }
}

struct PlantPolaroidArt: View {
    var body: some View { AssetArt(name: "HomePlantPolaroid") }
}

struct TokyoPostcardArt: View {
    var body: some View { AssetArt(name: "HomeTokyoPostcard") }
}

struct EnergyStampArt: View {
    var body: some View { AssetArt(name: "HomeEnergyStamp") }
}

struct QuickActionArt: View {
    let name: String
    var body: some View { AssetArt(name: name) }
}
