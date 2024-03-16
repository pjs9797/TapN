import SwiftUI

struct SuccessPopupView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 10*Constants.standardHeight) {
            Spacer().frame(height: 10*Constants.standardHeight)
            Text(LocalizedStringKey("성공!"))
                .font(ThemeManager.Fonts.GaeguBold(size: 50*Constants.standartFont))
                .foregroundColor(ThemeManager.Colors.prColor06)
            Text("\(gameViewModel.timerString)")
                .font(ThemeManager.Fonts.Chalkboard(size: 40*Constants.standartFont))
                .foregroundColor(.black)
            Button(action: {
                gameViewModel.resetGame()
                gameViewModel.gameEnded = false
            }){
                Text(LocalizedStringKey("확인"))
                    .font(ThemeManager.Fonts.GaeguRegular(size: 30*Constants.standartFont))
                    .foregroundColor(Color.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(ThemeManager.Colors.prColor05)
        }
        .frame(width: 250*Constants.standardWidth)
        .background(ThemeManager.Colors.prColor01)
        .cornerRadius(20*Constants.standardHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 20*Constants.standardHeight)
                .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
        )
    }
}

