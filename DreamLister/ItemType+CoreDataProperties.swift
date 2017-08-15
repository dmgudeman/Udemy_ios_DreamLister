//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by David Gudeman on 8/15/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import Foundation
import CoreData
 

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
