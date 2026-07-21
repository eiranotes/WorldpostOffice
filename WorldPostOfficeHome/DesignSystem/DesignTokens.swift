import SwiftUI

enum AppColor {
    static let background = Color(red: 1.00, green: 0.975, blue: 0.935)
    static let surface = Color(red: 1.00, green: 0.992, blue: 0.970)
    static let surfaceMint = Color(red: 0.945, green: 0.988, blue: 0.970)
    static let surfaceWarm = Color(red: 1.00, green: 0.965, blue: 0.880)
    static let surfaceBlue = Color(red: 0.940, green: 0.970, blue: 1.00)
    static let mint = Color(red: 0.235, green: 0.705, blue: 0.560)
    static let mintDark = Color(red: 0.105, green: 0.530, blue: 0.405)
    static let coral = Color(red: 1.00, green: 0.430, blue: 0.350)
    static let coralPressed = Color(red: 0.900, green: 0.330, blue: 0.285)
    static let gold = Color(red: 0.955, green: 0.660, blue: 0.165)
    static let blue = Color(red: 0.260, green: 0.550, blue: 0.850)
    static let ink = Color(red: 0.190, green: 0.120, blue: 0.090)
    static let secondaryInk = Color(red: 0.440, green: 0.360, blue: 0.320)
    static let mutedInk = Color(red: 0.610, green: 0.550, blue: 0.510)
    static let border = Color(red: 0.900, green: 0.835, blue: 0.765)
    static let hairline = Color(red: 0.930, green: 0.890, blue: 0.840)
    static let tabBar = Color.white.opacity(0.985)
}

enum AppMetric {
    static let screenHorizontal: CGFloat = 16
    static let cardRadius: CGFloat = 24
    static let smallRadius: CGFloat = 14
    static let controlRadius: CGFloat = 18
    static let tabBarHeight: CGFloat = 82
}

extension Font {
    static func app(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}

struct AppShadow: ViewModifier {
    var color: Color = Color.black.opacity(0.085)
    var radius: CGFloat = 12
    var x: CGFloat = 0
    var y: CGFloat = 5

    func body(content: Content) -> some View {
        content.shadow(color: color, radius: radius, x: x, y: y)
    }
}

extension View {
    func appShadow(
        color: Color = Color.black.opacity(0.085),
        radius: CGFloat = 12,
        x: CGFloat = 0,
        y: CGFloat = 5
    ) -> some View {
        modifier(AppShadow(color: color, radius: radius, x: x, y: y))
    }
}
