import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ThemeManager.Images.left
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35*Constants.standardHeight, height: 35*Constants.standardHeight)
                .foregroundColor(ThemeManager.Colors.prColor06)
        }
        .padding(.leading, 20)
        .padding(.top, 13*Constants.standardHeight)
    }
}
