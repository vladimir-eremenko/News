//
//  DataService.swift
//  TestApp
//
//  Created by vladimir on 18.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

final class DataService  {
    func fetchSources(completion: @escaping (Result<[Source], Error>) -> Void) {
        
        requestSources { (result) in
            switch result {
               case .failure(let error):
                   completion(.failure(error))
               case .success(let resultArray):
                    completion(.success(resultArray))
            }
        }
    }
    
    private func requestSources(completion : @escaping (Result<[Source], Error>) -> Void) {
        APIClient.sources { (result) in
            switch result {
               case .failure(let error):
                   completion(.failure(error))
               case .success(let resultArray):
                guard let sources = Mapper<Source>().mapArray(JSONObject: resultArray) else {
                    let error : Error = AppError.invalidResponse
                    completion(.failure(error))
                    return
                }
                completion(.success(sources))
            }
        }
    }
}
