//
//  Source.swift
//  TestApp
//
//  Created by vladimir on 17.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import ObjectMapper

class Source : Mappable {
    
    var id : String = ""
    var name : String = ""
    var sourceDesc : String = ""
    var url : String = ""
    var category : String = ""
    var language : String = ""
    var country : String = ""
    var isFavorite : Bool = false
    
    required convenience init?(map: Map) {
        self.init()
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

extension Source: Equatable {
    static func ==(lhs: Source, rhs: Source) -> Bool {
        return lhs.id == rhs.id
    }
}
