import SwiftUI

struct PlayButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(ThemeManager.Fonts.GaeguBold(size: 30*Constants.standartFont))
            .frame(width: 250*Constants.standardWidth, height: 50*Constants.standardHeight)
            .background(ThemeManager.Colors.prColor05)
            .foregroundColor(Color.white)
            .cornerRadius(10*Constants.standardHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 10*Constants.standardHeight)
                    .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
    }
}
