import SwiftUI

struct StartButtonStyle: ButtonStyle {
    @StateObject var viewModel: HomeViewViewModel
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 30*Constants.standartFont, weight: .regular, design: .rounded))
            .frame(width: 300*Constants.standardWidth, height: 70*Constants.standardHeight)
            .background(viewModel.isStartButtonEnabled ? ThemeManager.Colors.prColor06 : Color.white)
            .foregroundColor(viewModel.isStartButtonEnabled ? Color.white : ThemeManager.Colors.prColor06)
            .cornerRadius(20*Constants.standardHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 20*Constants.standardHeight)
                    .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
    }
}
