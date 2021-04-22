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

    @NSManaged public var userName: String?
    @NSManaged public var password: String?
    @NSManaged public var finances: Finance?

}

extension User : Identifiable {

}
