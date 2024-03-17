import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack(spacing: 20*Constants.standardHeight) {
            ZStack{
                HStack(alignment: .center){
                    BackButton()
                        .padding(.top, -13*Constants.standardHeight)
                        .padding(.leading, -10*Constants.standardWidth)
                    Spacer()
                }
                Text(LocalizedStringKey("개인정보 처리방침"))
                    .foregroundColor(ThemeManager.Colors.prColor06)
                    .font(ThemeManager.Fonts.GaeguBold(size: 40*Constants.standartFont))
                    .frame(maxWidth: .infinity)
            }
            ScrollView{
                Text(LocalizedStringKey("개인정보 처리방침 설명"))
                    .multilineTextAlignment(.leading)
                Spacer().frame(height: 20*Constants.standardHeight)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ThemeManager.Colors.bgColor)
    }
}

struct Previews_PrivacyPolicyView: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
                PrivacyPolicyView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.locale, Locale(identifier: "ko_KR")) // 한국어 설정
                    .previewDisplayName("\(deviceName) in Korean")
                
                PrivacyPolicyView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.locale, Locale(identifier: "en_US")) // 영어 설정
                    .previewDisplayName("\(deviceName) in English")
            }
        }
    }
}
