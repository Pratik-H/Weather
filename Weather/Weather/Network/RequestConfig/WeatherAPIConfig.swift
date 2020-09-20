//
//  WeatherAPIConfig.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation
import Alamofire

typealias AnyDict = [String: Any]


enum WeatherAPIConfig {
    
    // MARK: - API Calls
    case getWeatherForLocation(AnyDict)
    
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
            case .getWeatherForLocation:
                return .get
        }
    }
    
    
    // MARK: - Path
    var path: String {
        switch self {
            case .getWeatherForLocation:
                return AppConfig.URLS.apiBaseURLString
        }
    }
    
    var absolutePath: String {
        switch self {
            default:
                return AppConfig.URLS.apiBaseURLString
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
            case .getWeatherForLocation(let AnyDict):
            return AnyDict
        }
    }
    
    // MARK: - Header
    var headers: HTTPHeaders? {
        let headersDict = HTTPHeaders()
        switch self {
            case .getWeatherForLocation:
                return headersDict
        }
    }
    
    // MARK: - Encoder
    var encoding: ParameterEncoding {
        switch self {
            case .getWeatherForLocation:
                return URLEncoding.default
        }
    }
    
}
