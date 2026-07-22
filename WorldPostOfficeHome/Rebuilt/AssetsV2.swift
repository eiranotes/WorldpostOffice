import SwiftUI

private struct GeneratedAssetImage: View {
    let name: String

    var body: some View {
        Image(name, bundle: .main)
            .resizable()
            .interpolation(.high)
            .scaledToFit()
            .accessibilityHidden(true)
    }
}

struct ProfileCatArt: View {
    var body: some View { GeneratedAssetImage(name: "ProfileCatAvatar") }
}

private struct MascotPostmanArt: View {
    var body: some View { GeneratedAssetImage(name: "MascotPostman") }
}

struct PlantPolaroidArt: View {
    var body: some View { GeneratedAssetImage(name: "PlantPolaroid") }
}

struct BunnyAvatarArt: View {
    var body: some View { GeneratedAssetImage(name: "TravelerRabbitAvatar") }
}

struct HeartEnvelopeArt: View {
    var body: some View { GeneratedAssetImage(name: "HeartEnvelope") }
}

struct TokyoPostcardArt: View {
    var body: some View { GeneratedAssetImage(name: "TokyoPostcard") }
}

struct HeroSceneArt: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomTrailing) {
                MiniPostOfficeArt()
                    .frame(width: proxy.size.width * 0.62, height: proxy.size.height * 0.78)
                    .offset(x: 5, y: 4)

                MascotPostmanArt()
                    .frame(width: proxy.size.width * 0.59, height: proxy.size.height)
                    .offset(x: -proxy.size.width * 0.35, y: 4)

                HeartEnvelopeArt()
                    .frame(width: 27, height: 27)
                    .rotationEffect(.degrees(-8))
                    .offset(x: -proxy.size.width * 0.65, y: -proxy.size.height * 0.55)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .accessibilityHidden(true)
    }
}

private struct MiniPostOfficeArt: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(alignment: .bottom, spacing: -8) {
                ForEach(0..<5, id: \.self) { index in
                    Circle()
                        .fill(index.isMultiple(of: 2) ? Color(red: 0.66, green: 0.78, blue: 0.43) : Color(red: 0.78, green: 0.86, blue: 0.55))
                        .frame(width: 31, height: 31)
                }
            }
            .offset(y: 4)

            HStack(alignment: .bottom, spacing: 7) {
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(red: 1.00, green: 0.88, blue: 0.67))
                        .frame(width: 67, height: 52)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(red: 0.83, green: 0.57, blue: 0.34), lineWidth: 1.2))

                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 18))
                        path.addLine(to: CGPoint(x: 35, y: 0))
                        path.addLine(to: CGPoint(x: 70, y: 18))
                        path.closeSubpath()
                    }
                    .fill(Color(red: 0.89, green: 0.43, blue: 0.28))
                    .frame(width: 70, height: 20)
                    .offset(y: -43)

                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(red: 0.43, green: 0.61, blue: 0.67))
                        .frame(width: 17, height: 27)
                        .offset(y: -1)

                    Text("POST")
                        .font(.system(size: 6, weight: .bold, design: .rounded))
                        .foregroundStyle(Color(red: 0.60, green: 0.38, blue: 0.23))
                        .offset(y: -34)
                }
                .frame(width: 72, height: 72)

                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(red: 0.90, green: 0.26, blue: 0.20))
                        .frame(width: 25, height: 42)
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(red: 1.0, green: 0.76, blue: 0.58))
                        .frame(width: 16, height: 8)
                        .padding(.top, 8)
                }
                .frame(width: 27, height: 42)
            }
        }
    }
}

struct EnergyStampArt: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 9)
                .fill(Color(red: 1.0, green: 0.91, blue: 0.68))
                .overlay(RoundedRectangle(cornerRadius: 9).stroke(AppColor.gold.opacity(0.65), style: StrokeStyle(lineWidth: 1.2, dash: [3, 2])))
            Image(systemName: "bolt.fill")
                .font(.system(size: 23, weight: .bold))
                .foregroundStyle(AppColor.gold)
                .shadow(color: .white.opacity(0.9), radius: 1)
        }
        .rotationEffect(.degrees(-5))
        .accessibilityHidden(true)
    }
}
