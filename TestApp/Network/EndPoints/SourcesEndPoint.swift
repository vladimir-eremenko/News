//
//  SourcesEndPoint.swift
//  TestApp
//
//  Created by vladimir on 16.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import Alamofire

enum SourcesEndPoint: APIConfiguration {
    
    case sources
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .sources:
            return .get
       
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .sources:
            return "/sources"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .sources :
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ApiStruct.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // Parameters
        do {
            let parameterEncoding = URLEncoding()
            urlRequest = try parameterEncoding.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Auth Header
         urlRequest.setValue(ApiStruct.APIKey.apiKey, forHTTPHeaderField: HTTPHeaderField.xapikey.rawValue)
        
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        return urlRequest
    }
}
