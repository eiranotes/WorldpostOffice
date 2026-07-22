import SwiftUI

private struct AssetImage: View {
    let name: String

    var body: some View {
        Image(name, bundle: .main)
            .resizable()
            .interpolation(.high)
            .scaledToFit()
            .accessibilityHidden(true)
    }
}

struct ProfileCatArt: View { var body: some View { AssetImage(name: "ProfileCatAvatar") } }
struct HeroSceneArt: View { var body: some View { AssetImage(name: "HeroScene") } }
struct PlantPolaroidArt: View { var body: some View { AssetImage(name: "PlantPolaroid") } }
struct EnergyStampArt: View { var body: some View { AssetImage(name: "EnergyStamp") } }
struct BunnyAvatarArt: View { var body: some View { AssetImage(name: "BunnyAvatar") } }
struct HeartEnvelopeArt: View { var body: some View { AssetImage(name: "HeartEnvelope") } }
struct TokyoPostcardArt: View { var body: some View { AssetImage(name: "TokyoPostcard") } }
struct QuickChecklistArt: View { var body: some View { AssetImage(name: "QuickChecklist") } }
struct QuickStampAlbumArt: View { var body: some View { AssetImage(name: "QuickStampAlbum") } }
struct QuickGiftArt: View { var body: some View { AssetImage(name: "QuickGift") } }
struct QuickShopArt: View { var body: some View { AssetImage(name: "QuickShop") } }
