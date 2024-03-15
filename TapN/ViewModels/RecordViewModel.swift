import Combine
import CoreData

class RecordViewModel: ObservableObject {
    @Published var selectedType: String = "1 To 9"
    @Published var records: [NSManagedObject] = []
    
    func loadRecords(using context: NSManagedObjectContext) {
        self.records = GameDataManager.shared.fetchRecords(gameType: selectedType, context: context)
    }
    
    func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "Unknown Date" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
