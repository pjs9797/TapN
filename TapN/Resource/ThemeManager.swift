import SwiftUI

struct ThemeManager {
    struct Colors {
        static let bgColor = Color("bgColor")
        static let prColor01 = Color("prColor01")
        static let prColor02 = Color("prColor02")
        static let prColor03 = Color("prColor03")
        static let prColor04 = Color("prColor04")
        static let prColor05 = Color("prColor05")
        static let prColor06 = Color("prColor06")
    }
    
    struct Images {
        static let logo = Image("logo")
        static let setting = Image("setting")
        static let left = Image("left")
        static let right = Image("right")
        static let record = Image("record")
        static let refresh = Image("refresh")
    }
    
    struct Fonts {
        static func Chalkboard(size: CGFloat) -> Font {
            return .custom("Chalkboard SE", size: size)
        }
        
        static func GaeguBold(size: CGFloat) -> Font {
            return .custom("Gaegu-Bold", size: size)
        }
        
        static func GaeguLight(size: CGFloat) -> Font {
            return .custom("Gaegu-Light", size: size)
        }
        
        static func GaeguRegular(size: CGFloat) -> Font {
            return .custom("Gaegu-Regular", size: size)
        }
    }
}
