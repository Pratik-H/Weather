//
//  AppConfig.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation
import Alamofire

class AppConfig {
    
    // MARK: - URLS
    struct URLS {
        static let apiBaseURLString = Bundle.main.object(forInfoDictionaryKey: "APIBaseURL") as! String
    }
    
    // MARK: - Keys
    struct KEYS {
        static let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKey") as! String
    }
    
    // MARK: - Methods
    class func networkReachability() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
