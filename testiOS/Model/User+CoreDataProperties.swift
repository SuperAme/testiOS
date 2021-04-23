//
//  User+CoreDataProperties.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var finances: NSSet?

}

// MARK: Generated accessors for finances
extension User {

    @objc(addFinancesObject:)
    @NSManaged public func addToFinances(_ value: Finance)

    @objc(removeFinancesObject:)
    @NSManaged public func removeFromFinances(_ value: Finance)

    @objc(addFinances:)
    @NSManaged public func addToFinances(_ values: NSSet)

    @objc(removeFinances:)
    @NSManaged public func removeFromFinances(_ values: NSSet)

}

extension User : Identifiable {

}
