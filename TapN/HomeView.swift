import SwiftUI

struct ContentView: View {
    @StateObject private var homeViewModel = HomeViewViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Tap N")
                .foregroundColor(ThemeManager.Colors.prColor06)
                .font(.custom("Chalkboard SE", size: 50*Constants.standartFont))
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer().frame(height: 40*Constants.standardHeight)
            ThemeManager.Images.logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200*Constants.standardWidth, height: 200*Constants.standardHeight)
            Spacer()
                .frame(height: 40*Constants.standardHeight)
            VStack(spacing: 30*Constants.standardWidth) {
                Button("1 To 9") {
                    homeViewModel.updateSelection(to: "1 To 9")
                }.buttonStyle(TypeButtonStyle(viewModel: homeViewModel, type: "1 To 9"))
                
                
                Button("1 To 16") {
                    homeViewModel.updateSelection(to: "1 To 16")
                }.buttonStyle(TypeButtonStyle(viewModel: homeViewModel, type: "1 To 16"))
                
                Button("1 To 25") {
                    homeViewModel.updateSelection(to: "1 To 25")
                }.buttonStyle(TypeButtonStyle(viewModel: homeViewModel, type: "1 To 25"))
            }
            Spacer()
                .frame(height: 60*Constants.standardHeight)
            Button("시작하기"){ }.buttonStyle(StartButtonStyle(viewModel: homeViewModel))
            Spacer()
        }
        .background(ThemeManager.Colors.bgColor)
        
    }
}

struct Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
