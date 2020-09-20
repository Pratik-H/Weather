//
//  WeatherError.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case error(String)
}

extension WeatherError {
    
    var errorDescription: String {
        switch self {
            case .error(let error):
            return "\(error)"
        }
    }
}
