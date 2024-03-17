import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack{
                    HStack(alignment: .center){
                        BackButton()
                        Spacer()
                    }
                    Text(LocalizedStringKey("설정"))
                        .foregroundColor(ThemeManager.Colors.prColor06)
                        .font(ThemeManager.Fonts.GaeguBold(size: 40*Constants.standartFont))
                        .frame(maxWidth: .infinity)
                }
                Spacer().frame(height: 40*Constants.standardHeight)
                HStack{
                    Spacer().frame(width: 40*Constants.standardWidth)
                    Text(LocalizedStringKey("버전"))
                        .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                    Spacer()
                    Text("1.0")
                        .font(.system(size: 20*Constants.standartFont,weight: .bold,design: .rounded))
                    Spacer().frame(width: 40*Constants.standardWidth)
                }
                Spacer().frame(height: 20*Constants.standardHeight)
                HStack{
                    Spacer().frame(width: 40*Constants.standardWidth)
                    Text(LocalizedStringKey("개인정보 처리방침"))
                        .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                    Spacer()
                    RightNavItemLink(destination: PrivacyPolicyView(), image: ThemeManager.Images.right)
                        .padding(.bottom, 15*Constants.standardHeight)
                    Spacer().frame(width: 10*Constants.standardWidth)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ThemeManager.Colors.bgColor)
        }
    }
}

struct Previews_SettingView: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
            SettingView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
