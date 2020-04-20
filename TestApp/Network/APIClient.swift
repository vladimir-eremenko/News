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
    
    static func sources(completion:@escaping (Result<[Any], Error>)->Void) {
        
        AF.request(SourcesEndPoint.sources).responseJSON { (response) in
            switch (response.result){
            case .success:
                
                let responseDict = response.value as! Dictionary<String, Any>
                let resultArray = responseDict["sources"] as! [Any]
                
                completion(.success(resultArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
//        AF.request(SourcesEndPoint.sources).responseString {(response) in
//            guard let responseString = response.value else {
//                completion(.failure(response.error!))
//                return
//            }
//            completion(.success(responseString))
//        }
    }
    
    static func searchNews(searchString : String, completion:@escaping ((Result<String, Error>))->Void) {
        AF.request(EverythingEndPoint.search(searchString: searchString)).responseString { (response) in
            guard let responseString = response.value else {
                completion(.failure(response.error!))
                return
            }
            completion(.success(responseString))
        }
    }
}
