import SwiftUI

@main
struct TapNApp: App {
    let gameDataManager = GameDataManager.shared
    let languageManager = LanguageManager()
    
    init() {
        let selectedLanguage = UserDefaults.standard.string(forKey: "SelectedLanguage") ?? Locale.current.identifier
        let locale = Locale(identifier: selectedLanguage)
        if let languageCode = locale.language.languageCode?.identifier, let regionCode = locale.region?.identifier {
            let localizationIdentifier = "\(languageCode)-\(regionCode)"
            UserDefaults.standard.set([localizationIdentifier], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environment(\.managedObjectContext, gameDataManager.container.viewContext)
            .environmentObject(languageManager)
        }
    }
}
