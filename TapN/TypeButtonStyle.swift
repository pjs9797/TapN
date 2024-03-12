import SwiftUI

struct TypeButtonStyle: ButtonStyle {
    @StateObject var viewModel: HomeViewViewModel
    var type: String
    
    func makeBody(configuration: Configuration) -> some View {
        let isSelected = viewModel.selectedType == type
        configuration.label
            .font(.system(size: 24*Constants.standartFont, weight: .regular, design: .rounded))
            .frame(width: 200*Constants.standardWidth, height: 50*Constants.standardHeight)
            .background(isSelected ? ThemeManager.Colors.prColor04 : Color.white)
            .foregroundColor(isSelected ? Color.white : ThemeManager.Colors.prColor06)
            .cornerRadius(20*Constants.standardHeight)
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 20*Constants.standardHeight)
                    .stroke(ThemeManager.Colors.prColor06, lineWidth: 2)
            )
        
    }
}
