//
//  Consts.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation

struct Constants {
    static let favoritesArrayKey = "favoritesArrayKey"
}

extension Notification.Name {
    static let favoriteSourceAdded = Notification.Name("favoriteSourceAdded")
    static let favoriteSourceRemoved = Notification.Name("favoriteSourceRemoved")
}

struct ApiStruct {
    struct ProductionServer {
        static let baseURL = "http://newsapi.org/v2"
    }
    
    struct APIKey {
        static let apiKey = "d0e1f08304b74a7bb94c1aed42dc1c2a"
    }
    
    struct APIParameterKey {
        static let searchKey = "q"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case xapikey = "X-Api-Key"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
