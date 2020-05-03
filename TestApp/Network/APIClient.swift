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
    }
    
    static func searchNews(searchString : String, completion:@escaping ((Result<[Any], Error>))->Void) {
        AF.request(EverythingEndPoint.search(searchString: searchString)).responseJSON { (response) in
            switch (response.result){
            case .success:
                
                let responseDict = response.value as! Dictionary<String, Any>
                let resultArray = responseDict["articles"] as! [Any]
                
                completion(.success(resultArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func newsOfSources(sourceIds: [String], completion:@escaping ((Result<[Any], Error>))->Void) {
        
        if sourceIds.count == 0 {
            let error : Error = AppError.invalidParameters
            completion(.failure(error))
            return
        }
        
        AF.request(EverythingEndPoint.newsOf(sources: sourceIds)).responseJSON { (response) in
            switch (response.result){
            case .success:
                
                let responseDict = response.value as! Dictionary<String, Any>
                let resultArray = responseDict["articles"] as! [Any]
                
                completion(.success(resultArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
