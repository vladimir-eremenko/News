//
//  EverythingEndPoint.swift
//  TestApp
//
//  Created by vladimir on 16.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import Alamofire

enum EverythingEndPoint: APIConfiguration {
    
    case auth
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .auth:
            return .get
       
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .auth:
            return ""
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .auth :
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ApiStruct.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ApiStruct.APIParameterKey.apiKey, forHTTPHeaderField: HTTPHeaderField.xapikey.rawValue)
 
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
