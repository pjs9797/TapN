//
//  TypeThree+CoreDataProperties.swift
//  TapN
//
//  Created by 박중선 on 3/14/24.
//
//

import Foundation
import CoreData


extension TypeThree {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TypeThree> {
        return NSFetchRequest<TypeThree>(entityName: "TypeThree")
    }

    @NSManaged public var record: String
    @NSManaged public var date: Date

}

extension TypeThree : Identifiable {

}
