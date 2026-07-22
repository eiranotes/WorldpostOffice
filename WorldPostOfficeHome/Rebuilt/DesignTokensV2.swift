import SwiftUI

enum AppColor {
    static let background = Color(red: 1.00, green: 0.982, blue: 0.952)
    static let surface = Color(red: 1.00, green: 0.996, blue: 0.982)
    static let mintSurface = Color(red: 0.947, green: 0.988, blue: 0.970)
    static let warmSurface = Color(red: 1.00, green: 0.972, blue: 0.910)
    static let blueSurface = Color(red: 0.948, green: 0.974, blue: 0.998)
    static let mint = Color(red: 0.23, green: 0.72, blue: 0.58)
    static let mintDark = Color(red: 0.08, green: 0.50, blue: 0.38)
    static let coral = Color(red: 1.00, green: 0.43, blue: 0.35)
    static let gold = Color(red: 0.96, green: 0.68, blue: 0.20)
    static let blue = Color(red: 0.25, green: 0.54, blue: 0.82)
    static let ink = Color(red: 0.19, green: 0.13, blue: 0.10)
    static let secondaryInk = Color(red: 0.43, green: 0.35, blue: 0.31)
    static let mutedInk = Color(red: 0.61, green: 0.55, blue: 0.51)
    static let border = Color(red: 0.91, green: 0.85, blue: 0.78)
}

enum AppMetric {
    static let horizontal: CGFloat = 14
    static let cardRadius: CGFloat = 24
    static let tabHeight: CGFloat = 70
}

extension Font {
    static func app(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}

extension View {
    func softShadow(radius: CGFloat = 8, y: CGFloat = 3) -> some View {
        shadow(color: Color.black.opacity(0.075), radius: radius, x: 0, y: y)
    }
}
