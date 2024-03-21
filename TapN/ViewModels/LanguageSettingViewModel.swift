import Combine
import Foundation

class LanguageSettingViewModel: ObservableObject {
    @Published var selectedLanguage: String = (UserDefaults.standard.string(forKey: "SelectedLanguage") ?? Locale.current.identifier)
}
