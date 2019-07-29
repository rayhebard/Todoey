//
//  Item.swift
//  Todoey
//
//  Created by Raymond Hebard on 7/25/19.
//  Copyright © 2019 Raymond Hebard. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
