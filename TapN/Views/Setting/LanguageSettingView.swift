import SwiftUI

struct LanguageSettingView: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(spacing: 20*Constants.standardHeight) {
            ZStack{
                HStack(alignment: .center){
                    BackButton()
                        .padding(.top, -13*Constants.standardHeight)
                        .padding(.leading, -10*Constants.standardWidth)
                    Spacer()
                }
                Text(languageManager.localizedString(forKey: "언어 설정"))
                    .foregroundColor(ThemeManager.Colors.prColor06)
                    .font(ThemeManager.Fonts.GaeguBold(size: 40*Constants.standartFont))
                    .frame(maxWidth: .infinity)
            }
            VStack {
                Spacer().frame(height: 40*Constants.standardHeight)
                Button(action: {
                    languageManager.setLanguage("ko")
                }){
                    HStack {
                        Spacer().frame(width: 40*Constants.standardWidth)
                        Text(languageManager.localizedString(forKey: "한국어"))
                            .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                            .foregroundColor(.black)
                        Spacer()
                        if languageManager.selectedLanguage == "ko" {
                            Image(systemName: "checkmark")
                        }
                        Spacer().frame(width: 40*Constants.standardWidth)
                    }
                }
                Spacer().frame(height: 20*Constants.standardHeight)
                Button(action: {
                    languageManager.setLanguage("en")
                }){
                    HStack {
                        Spacer().frame(width: 40*Constants.standardWidth)
                        Text(languageManager.localizedString(forKey: "영어"))
                            .font(.system(size: 25*Constants.standartFont,weight: .regular,design: .rounded))
                            .foregroundColor(.black)
                        Spacer()
                        if languageManager.selectedLanguage == "en" {
                            Image(systemName: "checkmark")
                        }
                        Spacer().frame(width: 40*Constants.standardWidth)
                    }
                }
            }
            Spacer()
        }
        .background(ThemeManager.Colors.bgColor)
        .navigationBarHidden(true)
    }
}

struct Previews_LanguageSettingView: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
                LanguageSettingView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
            }
        }
    }
}
