import SwiftUI

struct StartTextStyle: ViewModifier {
    var isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30*Constants.standartFont, weight: .regular, design: .rounded))
            .frame(width: 350*Constants.standardWidth, height: 70*Constants.standardHeight)
            .background(isEnabled ? ThemeManager.Colors.prColor06 : Color.white)
            .foregroundColor(isEnabled ? Color.white : ThemeManager.Colors.prColor06)
            .cornerRadius(20*Constants.standardHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 20*Constants.standardHeight)
                    .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
            )
    }
}
