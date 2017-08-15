//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by David Gudeman on 8/15/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?
    @NSManaged public var toImage: Image?

}
