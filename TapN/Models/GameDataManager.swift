import CoreData

struct GameDataManager {
    static let shared = GameDataManager()
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "GameData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveGameRecord(gameType: String, record: String, context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        let entityName: String
        
        switch gameType {
        case "1 To 9":
            fetchRequest = TypeOne.fetchRequest()
            entityName = "TypeOne"
        case "1 To 16":
            fetchRequest = TypeTwo.fetchRequest()
            entityName = "TypeTwo"
        case "1 To 25":
            fetchRequest = TypeThree.fetchRequest()
            entityName = "TypeThree"
        default:
            return
        }
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "record", ascending: true)]
        
        do {
            let results = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if results.count >= 100, let longestRecord = results.last {
                if let longestRecordValue = longestRecord.value(forKey: "record") as? String, longestRecordValue > record {
                    context.delete(longestRecord)
                } else {
                    return
                }
            }
            
            let newRecord = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
            newRecord.setValue(record, forKey: "record")
            newRecord.setValue(Date(), forKey: "date")
            
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Error saving context: \(nserror), \(nserror.userInfo)")
        }
    }
    
    func fetchRecords(gameType: String, context: NSManagedObjectContext) -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        
        switch gameType {
        case "1 To 9":
            fetchRequest = TypeOne.fetchRequest()
        case "1 To 16":
            fetchRequest = TypeTwo.fetchRequest()
        case "1 To 25":
            fetchRequest = TypeThree.fetchRequest()
        default:
            return []
        }
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "record", ascending: true)]
        
        do {
            let results = try context.fetch(fetchRequest)
            return results as? [NSManagedObject] ?? []
        } catch {
            print("Failed to fetch records: \(error)")
            return []
        }
    }
    
    func insertMockData(context: NSManagedObjectContext) {
        let newRecord = TypeOne(context: context)
        newRecord.record = "00:01:23"
        newRecord.date = Date()

        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Error inserting mock data: \(nserror), \(nserror.userInfo)")
        }
    }
}
