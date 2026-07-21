import SwiftUI

struct CatAvatarArt: View {
    var body: some View {
        ZStack {
            Circle().fill(AppColor.surfaceWarm)
            Circle().stroke(AppColor.coral.opacity(0.35), style: StrokeStyle(lineWidth: 1.5, dash: [5, 4]))
            VStack(spacing: -4) {
                Text("🐱").font(.system(size: 38))
                Text("✉️").font(.system(size: 15))
            }
        }
        .accessibilityHidden(true)
    }
}

struct BunnyAvatarArt: View {
    var body: some View {
        ZStack {
            Circle().fill(AppColor.surfaceBlue)
            Circle().stroke(AppColor.border, lineWidth: 1)
            Text("🐰").font(.system(size: 39))
        }
        .accessibilityHidden(true)
    }
}

struct MascotSceneArt: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Capsule()
                .fill(AppColor.mint.opacity(0.12))
                .frame(width: 210, height: 60)
                .offset(y: 12)
            HStack(alignment: .bottom, spacing: 7) {
                VStack(spacing: -6) {
                    Text("☁️").font(.system(size: 22))
                    Text("🌿").font(.system(size: 30))
                }
                Text("🐱").font(.system(size: 72))
                VStack(spacing: -5) {
                    Text("🏤").font(.system(size: 54))
                    Text("📮").font(.system(size: 27))
                }
            }
        }
        .accessibilityHidden(true)
    }
}

struct PlantPolaroidArt: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                LinearGradient(
                    colors: [Color(red: 0.91, green: 0.96, blue: 0.89), Color(red: 0.98, green: 0.89, blue: 0.72)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.white.opacity(0.45))
                    .frame(width: 38, height: 98)
                    .offset(x: 37, y: -5)
                Text("🪴")
                    .font(.system(size: 72))
                    .offset(y: 2)
            }
            .frame(height: 116)
            Text("TODAY'S GREEN")
                .font(.system(size: 8, weight: .bold, design: .rounded))
                .foregroundStyle(AppColor.secondaryInk)
                .frame(maxWidth: .infinity)
                .frame(height: 24)
                .background(Color.white)
        }
        .padding(7)
        .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
        .accessibilityHidden(true)
    }
}

struct TokyoPostcardArt: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.72, green: 0.88, blue: 1.0), Color(red: 1.0, green: 0.78, blue: 0.82)],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack(spacing: -5) {
                Text("🗻").font(.system(size: 40))
                HStack(spacing: 4) {
                    Text("🌸").font(.system(size: 23))
                    Text("🗼").font(.system(size: 39))
                    Text("🌸").font(.system(size: 23))
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Text("JAPAN")
                        .font(.system(size: 7, weight: .bold, design: .rounded))
                        .padding(4)
                        .background(Color.white.opacity(0.82), in: RoundedRectangle(cornerRadius: 3))
                }
                Spacer()
            }
            .padding(6)
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
        .accessibilityHidden(true)
    }
}
