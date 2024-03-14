import SwiftUI

struct GameView: View {
    @StateObject var gameViewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack {
                    ZStack{
                        HStack(alignment: .center){
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                ThemeManager.Images.back
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35*Constants.standardHeight, height: 35*Constants.standardHeight)
                                    .foregroundColor(ThemeManager.Colors.prColor06)
                            }
                            .padding(.leading, 20)
                            .padding(.top, 13*Constants.standardHeight)
                            Spacer()
                        }
                        Text(gameViewModel.selectedType)
                            .foregroundColor(ThemeManager.Colors.prColor06)
                            .font(.custom("Chalkboard SE", size: 50*Constants.standartFont))
                            .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    Text(gameViewModel.timerString)
                        .font(.system(size: 40*Constants.standartFont, weight: .regular, design: .rounded))
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    LazyVGrid(columns: gameViewModel.columns, spacing: 2*Constants.standardHeight) {
                        ForEach(0..<gameViewModel.gameTiles.count, id: \.self) { index in
                            Button(action: {
                                withAnimation {
                                    let _ = gameViewModel.tapTile(at: index)
                                }
                            }) {
                                Text("\(gameViewModel.gameTiles[index].number)")
                                    .font(.system(size: 40*Constants.standartFont, weight: .regular, design: .rounded))
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(width: gameViewModel.cellSize(for: UIScreen.main.bounds.width), height: gameViewModel.cellSize(for: 500*Constants.standardHeight))
                            .background(ThemeManager.Colors.prColor06)
                            .foregroundColor(.white)
                            .cornerRadius(10*Constants.standardHeight)
                            .opacity(gameViewModel.gameTiles[index].isHidden ? 0 : 1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 4*Constants.standardWidth)
                    
                    Spacer()
                    
                    HStack(spacing: 0){
                        Spacer()
                        Button(action: {
                            gameViewModel.resetGame()
                        }) {
                            ThemeManager.Images.refresh
                                .resizable()
                                .frame(width: 24*Constants.standardHeight, height: 24*Constants.standardHeight)
                        }
                        .buttonStyle(RefreshButtonStyle())
                        Spacer()
                        Button("Play") {
                            gameViewModel.startGame()
                        }
                        .buttonStyle(PlayButtonStyle())
                        .disabled(gameViewModel.gameStarted)
                        Spacer()
                    }
                    
                    Spacer()
                }
                .background(ThemeManager.Colors.bgColor)
                .navigationBarHidden(true)
                
                if gameViewModel.gameEnded {
                    SuccessPopupView(gameViewModel: gameViewModel)
                }
            }
        }
    }
}

struct Previews_GameView: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
            GameView(gameViewModel: GameViewModel(selectedType: "1 To 9"))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}