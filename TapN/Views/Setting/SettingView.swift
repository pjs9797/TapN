import SwiftUI

struct SettingView: View {
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                HStack(alignment: .center){
                    BackButton()
                    Spacer()
                }
                Text(languageManager.localizedString(forKey: "설정"))
                    .foregroundColor(ThemeManager.Colors.prColor06)
                    .font(ThemeManager.Fonts.GaeguBold(size: 40*Constants.standartFont))
                    .frame(maxWidth: .infinity)
            }
            Spacer().frame(height: 40*Constants.standardHeight)
            HStack{
                Spacer().frame(width: 40*Constants.standardWidth)
                Text(languageManager.localizedString(forKey: "버전"))
                    .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                Spacer()
                Text("1.1")
                    .font(.system(size: 20*Constants.standartFont,weight: .bold,design: .rounded))
                Spacer().frame(width: 40*Constants.standardWidth)
            }
            Spacer().frame(height: 20*Constants.standardHeight)
            HStack{
                Spacer().frame(width: 40*Constants.standardWidth)
                Text(languageManager.localizedString(forKey: "언어 설정"))
                    .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                Spacer()
                RightNavItemLink(destination: LanguageSettingView(), image: ThemeManager.Images.right)
                    .padding(.bottom, 15*Constants.standardHeight)
                Spacer().frame(width: 10*Constants.standardWidth)
            }
            Spacer().frame(height: 20*Constants.standardHeight)
            HStack{
                Spacer().frame(width: 40*Constants.standardWidth)
                Text(languageManager.localizedString(forKey: "개인정보 처리방침"))
                    .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                Spacer()
                RightNavItemLink(destination: PrivacyPolicyView(), image: ThemeManager.Images.right)
                    .padding(.bottom, 15*Constants.standardHeight)
                Spacer().frame(width: 10*Constants.standardWidth)
            }
            Spacer()
        }
        .background(ThemeManager.Colors.bgColor)
        .navigationBarHidden(true)
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
