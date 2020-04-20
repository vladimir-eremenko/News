//
//  Source.swift
//  TestApp
//
//  Created by vladimir on 17.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class Source : Object, Mappable {
    
    @objc dynamic var id : String = ""
    @objc dynamic var name : String = ""
    @objc dynamic var sourceDesc : String = ""
    @objc dynamic var url : String = ""
    @objc dynamic var category : String = ""
    @objc dynamic var language : String = ""
    @objc dynamic var country : String = ""
    @objc dynamic var isFavorite : Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        sourceDesc <- map["description"]
        url <- map["url"]
        category <- map["category"]
        language <- map["language"]
        country <- map["country"]
    }
}
