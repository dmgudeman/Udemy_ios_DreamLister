//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by David Gudeman on 8/15/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
  
  public override func awakeFromInsert() {
    super.awakeFromInsert()
    self.created = NSDate()
  }
  
}
