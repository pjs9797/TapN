import Foundation
import CoreData


extension TypeOne {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TypeOne> {
        return NSFetchRequest<TypeOne>(entityName: "TypeOne")
    }

    @NSManaged public var date: Date
    @NSManaged public var record: String

}

extension TypeOne : Identifiable {

}
