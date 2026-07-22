import SwiftUI

private struct QuickActionV2Item: Identifiable {
    let id = UUID()
    let title: String
    let systemName: String
    let tint: Color
    let badge: Bool
}

struct QuickActionsRowV2: View {
    private let actions: [QuickActionV2Item] = [
        .init(title: "오늘의 기록", systemName: "checklist", tint: AppColor.mintDark, badge: false),
        .init(title: "우표 도감", systemName: "medal.fill", tint: Color(red: 0.67, green: 0.45, blue: 0.18), badge: false),
        .init(title: "이벤트", systemName: "gift.fill", tint: AppColor.coral, badge: true),
        .init(title: "상점", systemName: "storefront.fill", tint: AppColor.gold, badge: false)
    ]

    var body: some View {
        HStack(spacing: 6) {
            ForEach(actions) { item in
                Button(action: {}) {
                    HStack(spacing: 4) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: item.systemName)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(item.tint)
                                .frame(width: 26, height: 26)
                            if item.badge {
                                Circle().fill(Color.red).frame(width: 7, height: 7).offset(x: 2, y: -2)
                            }
                        }
                        Text(item.title)
                            .font(.app(9.3, weight: .semibold))
                            .foregroundStyle(AppColor.ink)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundStyle(AppColor.mutedInk)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(AppColor.surface, in: RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(AppColor.border.opacity(0.7), lineWidth: 1))
                }
                .buttonStyle(.plain)
            }
        }
    }
}
