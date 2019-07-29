//
//  Category.swift
//  Todoey
//
//  Created by Raymond Hebard on 7/25/19.
//  Copyright © 2019 Raymond Hebard. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
