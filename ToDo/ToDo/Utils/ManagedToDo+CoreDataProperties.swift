//
//  ManagedToDo+CoreDataProperties.swift
//  ToDo
//
//  Created by happy on 2020-06-24.
//  Copyright © 2020 Carlos. All rights reserved.
//

import Foundation
import CoreData


@objc(Managed)
public class Managed: NSManagedObject {

}

extension Managed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Managed> {
        return NSFetchRequest<Managed>(entityName: "Managed")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?

}
