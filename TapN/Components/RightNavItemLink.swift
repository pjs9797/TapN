import SwiftUI

struct RightNavItemLink<Destination: View>: View {
    var destination: Destination
    var image: Image
    
    var body: some View {
        NavigationLink(destination: destination) {
            image
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35*Constants.standardHeight, height: 35*Constants.standardHeight)
                .foregroundColor(ThemeManager.Colors.prColor06)
                .padding(.trailing, 20)
                .padding(.top, 13*Constants.standardHeight)
        }
    }
}
