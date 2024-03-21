import SwiftUI

struct GameView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject var gameViewModel: GameViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack {
                    ZStack{
                        HStack(alignment: .center){
                            BackButton()
                            Spacer()
                            RightNavItemLink(destination: RecordView(), image: ThemeManager.Images.record)
                        }
                        Text(gameViewModel.selectedType)
                            .foregroundColor(ThemeManager.Colors.prColor06)
                            .font(ThemeManager.Fonts.Chalkboard(size: 50*Constants.standartFont))
                            .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    Text(gameViewModel.timerString)
                        .font(ThemeManager.Fonts.Chalkboard(size: 40*Constants.standartFont))
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
                                    .font(ThemeManager.Fonts.GaeguBold(size: 50*Constants.standartFont))
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
                        Button(languageManager.localizedString(forKey: "게임하기")) {
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
            GameView(gameViewModel: GameViewModel(selectedType: "1 To 9", context: GameDataManager.shared.container.viewContext))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
