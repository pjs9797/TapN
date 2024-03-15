import SwiftUI

struct SuccessPopupView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("성공!")
                .font(.largeTitle)
                .foregroundColor(ThemeManager.Colors.prColor06)
            
            Text("\(gameViewModel.timerString)")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            Button(action: {
                gameViewModel.resetGame()
                gameViewModel.gameEnded = false
            }){
                Text("확인")
                    .font(.system(size: 20*Constants.standartFont, weight: .regular, design: .rounded))
                    .foregroundColor(Color.blue)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(width: 250*Constants.standardWidth)
        .background(ThemeManager.Colors.prColor01)
        .cornerRadius(20*Constants.standardHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 20*Constants.standardHeight)
                .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
        )
    }
}
