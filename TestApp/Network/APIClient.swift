//
//  APIClient.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func sources(completion:@escaping ((Result<String, Error>))->Void) {
        AF.request(SourcesEndPoint.sources).responseString {(response) in
            print("\(response)")
        }
    }
    
    static func searchNews(searchString : String, completion:@escaping ((Result<String, Error>))->Void) {
        AF.request(EverythingEndPoint.search(searchString: searchString)).responseString { (response) in
            print("\(response)")
        }
    }
}
