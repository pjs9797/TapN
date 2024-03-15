//
//  TypeOne+CoreDataProperties.swift
//  TapN
//
//  Created by 박중선 on 3/14/24.
//
//

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
