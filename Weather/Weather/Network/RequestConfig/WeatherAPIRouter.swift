//
//  WeatherAPIRouter.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation
import Alamofire

class WeatherAPIRouter {
    
    class func getData(ofURL url: WeatherAPIConfig, callback: @escaping (Result<Data, WeatherError>) -> Void) {
        if AppConfig.networkReachability() == true {
            
            NSLog("🟠 Requesting \(url.absolutePath) API 🤔...")
            AF.request(url.absolutePath, method: url.method,
                       parameters: url.parameters,
                       encoding: url.encoding,
                       headers: url.headers).validate(statusCode: 200...500).responseJSON { response in
                        
                        //                        print("\(response)")
                        switch response.result {
                            case .success:
                                if let data = response.data {
                                    NSLog("🟢 \(url.absolutePath) 😍")
                                    callback(.success(data))
                                } else {
                                    callback(.failure(.error(" API Request failed")))
                            }
                            case .failure(let error):
                                
                                NSLog("🔴 \(url.absolutePath) Request failed! \(error.localizedDescription) 😵")
                                callback(.failure(.error(error.localizedDescription)))
                        }
            }
        } else {
            NSLog("Network Not reachable")
        }
    }
}
