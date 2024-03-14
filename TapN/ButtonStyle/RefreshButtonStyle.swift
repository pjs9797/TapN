import SwiftUI

struct RefreshButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 50*Constants.standardHeight, height: 50*Constants.standardHeight)
            .background(ThemeManager.Colors.prColor02)
            .foregroundColor(Color.white)
            .cornerRadius(10*Constants.standardHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 10*Constants.standardHeight)
                    .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
    }
}
