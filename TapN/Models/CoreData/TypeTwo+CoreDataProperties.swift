//
//  TypeTwo+CoreDataProperties.swift
//  TapN
//
//  Created by 박중선 on 3/14/24.
//
//

import Foundation
import CoreData


extension TypeTwo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TypeTwo> {
        return NSFetchRequest<TypeTwo>(entityName: "TypeTwo")
    }

    @NSManaged public var record: String
    @NSManaged public var date: Date

}

extension TypeTwo : Identifiable {

}
