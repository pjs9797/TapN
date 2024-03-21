import Foundation

class LanguageManager: ObservableObject {
    @Published var selectedLanguage: String = UserDefaults.standard.string(forKey: "SelectedLanguage") ?? Locale.current.identifier
    private var bundle: Bundle?

    init() {
        updateBundle()
    }

    func setLanguage(_ languageCode: String) {
        UserDefaults.standard.set(languageCode, forKey: "SelectedLanguage")
        selectedLanguage = languageCode
        updateBundle()
    }

    private func updateBundle() {
        guard let languageCode = UserDefaults.standard.string(forKey: "SelectedLanguage"),
              let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            self.bundle = Bundle.main
            return
        }
        self.bundle = bundle
    }

    func localizedString(forKey key: String) -> String {
        bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }
}
