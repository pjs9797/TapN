import Combine
import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var selectedType: String? = nil
    @Published var isSelectedType1: Bool = false
    @Published var isSelectedType2: Bool = false
    @Published var isSelectedType3: Bool = false

    var isStartButtonEnabled: Bool {
        selectedType != nil
    }
    
    func updateSelection(to type: String) {
        selectedType = type
        isSelectedType1 = type == "1 To 9"
        isSelectedType2 = type == "1 To 16"
        isSelectedType3 = type == "1 To 25"
    }
}
