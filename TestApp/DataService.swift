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

final class DataService  {
    static let shared = DataService()
    private init() {
        let defaults = UserDefaults.standard
        self.favoriteSourceIds =  defaults.object(forKey: Constants.favoritesArrayKey) as? [String] ?? [String]()
    }
    
    var sources : [Source] = []
    var favoriteSources : [Source] = []
    private var favoriteSourceIds: [String] = []
    
    func fetchSources(completion: @escaping (Result<[Source], Error>) -> Void) {
        
        requestSources { [weak weakSelf = self] (result) in
            switch result {
               case .failure(let error):
                   completion(.failure(error))
               case .success(let resultArray):
                self.sources = resultArray
                    weakSelf?.appendIsFavoriteTo(array: resultArray)
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
    
    private func appendIsFavoriteTo(array: [Source]) {
        let defaults = UserDefaults.standard
        favoriteSourceIds =  defaults.object(forKey: Constants.favoritesArrayKey) as? [String] ?? [String]()
        if favoriteSourceIds.count == 0 {return}
        for item in array {
            let itemId = item.id
            if favoriteSourceIds.contains(itemId) {
                item.isFavorite = true
                self.favoriteSources.append(item)
            }
        }
    }
    
    func saveFavorite(source: Source) {
        let sourceId = source.id
        favoriteSourceIds.append(sourceId)
        let defaults = UserDefaults.standard
        defaults.set(favoriteSourceIds, forKey: Constants.favoritesArrayKey)
        
        self.favoriteSources.append(source)
        
        NotificationCenter.default.post(name: .favoriteSourceAdded, object: nil)
    }
    
    func removeFavorite(source: Source) {
        let sourceId = source.id
        source.isFavorite = false
        if let index = self.favoriteSourceIds.firstIndex(of: sourceId) {
            self.favoriteSourceIds.remove(at: index)
            let defaults = UserDefaults.standard
            defaults.set(favoriteSourceIds, forKey: Constants.favoritesArrayKey)
        }
        if let index = self.favoriteSources.firstIndex(of: source) {
            self.favoriteSources.remove(at: index)
        }
        NotificationCenter.default.post(name: .favoriteSourceRemoved, object: nil)
    }
}
