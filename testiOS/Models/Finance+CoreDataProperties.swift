//
//  Finance+CoreDataProperties.swift
//  testiOS
//
//  Created by IDS Comercial on 23/04/21.
//
//

import Foundation
import CoreData


extension Finance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Finance> {
        return NSFetchRequest<Finance>(entityName: "Finance")
    }

    @NSManaged public var inOut: Bool
    @NSManaged public var descr: String?
    @NSManaged public var cuantity: Float

}

extension Finance : Identifiable {

}
