//
//  News.swift
//  TestApp
//
//  Created by vladimir on 22.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import ObjectMapper

class News : Mappable {
    
    var author : String = ""
    var title : String = ""
    var newsDesc : String = ""
    var url : String = ""
    var urlToImage : String = ""
    var publishedAt : String = ""
    var content : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        newsDesc <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
}
