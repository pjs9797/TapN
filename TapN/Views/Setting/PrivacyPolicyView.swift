import SwiftUI

struct PrivacyPolicyView: View {
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
                Text(languageManager.localizedString(forKey: "개인정보 처리방침"))
                    .foregroundColor(ThemeManager.Colors.prColor06)
                    .font(ThemeManager.Fonts.GaeguBold(size: 40*Constants.standartFont))
                    .frame(maxWidth: .infinity)
            }
            ScrollView{
                Text(languageManager.localizedString(forKey: "개인정보 처리방침 설명"))
                    .multilineTextAlignment(.leading)
                Spacer().frame(height: 20*Constants.standardHeight)
            }
        }
        .background(ThemeManager.Colors.bgColor)
        .navigationBarHidden(true)
    }
}

struct Previews_PrivacyPolicyView: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
                PrivacyPolicyView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.locale, Locale(identifier: "ko_KR"))
                    .previewDisplayName("\(deviceName) in Korean")
                
                PrivacyPolicyView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.locale, Locale(identifier: "en_US"))
                    .previewDisplayName("\(deviceName) in English")
            }
        }
    }
}
