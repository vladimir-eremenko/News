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
                    weakSelf?.sources = resultArray
                    weakSelf?.appendIsFavorite()
                    
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
    
    func searchNewsForString(searchString: String, completion :  @escaping (Result<[News], Error>) -> Void) {
        APIClient.searchNews(searchString: searchString) { (result) in
            switch result {
               case .failure(let error):
                   completion(.failure(error))
               case .success(let resultArray):
                guard let news = Mapper<News>().mapArray(JSONObject: resultArray) else {
                    let error : Error = AppError.invalidResponse
                    completion(.failure(error))
                    return
                }
                completion(.success(news))
            }
        }
    }
    
    func newsOfFavourite(completion :  @escaping (Result<[News], Error>) -> Void) {
        self.newsOf(sourceIds: self.favoriteSourceIds) { (result) in
            completion(result)
        }
    }
    
    func newsOf(sourceIds: [String], completion :  @escaping (Result<[News], Error>) -> Void) {
        APIClient.newsOfSources(sourceIds: sourceIds) { (result) in
            switch result {
               case .failure(let error):
                   completion(.failure(error))
               case .success(let resultArray):
                guard let news = Mapper<News>().mapArray(JSONObject: resultArray) else {
                    let error : Error = AppError.invalidResponse
                    completion(.failure(error))
                    return
                }
                completion(.success(news))
            }
        }
    }
    
    private func appendIsFavorite() {
        let defaults = UserDefaults.standard
        favoriteSourceIds =  defaults.object(forKey: Constants.favoritesArrayKey) as? [String] ?? [String]()
        if favoriteSourceIds.count == 0 {return}
        for item in self.sources {
            let itemId = item.id
            if favoriteSourceIds.contains(itemId){
                item.isFavorite = true
                if !self.favoriteSources.contains(item) {
                    self.favoriteSources.append(item)
                }
            }
        }
    }
    
    func saveFavorite(source: Source) {
        let sourceId = source.id
        favoriteSourceIds.append(sourceId)
        let defaults = UserDefaults.standard
        defaults.set(favoriteSourceIds, forKey: Constants.favoritesArrayKey)
        
        self.favoriteSources.append(source)
    }
    
    func removeFavorite(source: Source) {
        let sourceId = source.id
        source.isFavorite = false
        if let index = self.sources.firstIndex(of: source) {
            self.sources[index] = source
        }
        if let index = self.favoriteSourceIds.firstIndex(of: sourceId) {
            self.favoriteSourceIds.remove(at: index)
            let defaults = UserDefaults.standard
            defaults.set(favoriteSourceIds, forKey: Constants.favoritesArrayKey)
        }
        if let index = self.favoriteSources.firstIndex(of: source) {
            self.favoriteSources.remove(at: index)
        }
    }
}
