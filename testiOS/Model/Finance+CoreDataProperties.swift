//
//  Finance+CoreDataProperties.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//
//

import Foundation
import CoreData


extension Finance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Finance> {
        return NSFetchRequest<Finance>(entityName: "Finance")
    }

    @NSManaged public var inOut: Bool
    @NSManaged public var date: Date?
    @NSManaged public var descr: String?
    @NSManaged public var parentCategory: User?

}

extension Finance : Identifiable {

}
