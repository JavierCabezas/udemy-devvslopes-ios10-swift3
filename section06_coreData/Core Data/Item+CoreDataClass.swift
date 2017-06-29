//
//  Item+CoreDataClass.swift
//  Core Data
//
//  Created by Javier Cabezas Leyton on 6/28/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    // Auto set the date on insert
    public override func awakeFromInsert() {
            super.awakeFromInsert()
            self.created = NSDate()
    }
}
