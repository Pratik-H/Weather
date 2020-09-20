//
//  WeatherAPIParameters.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation

struct WeatherAPIParameters: Codable {
    let lat: Double
    let lon: Double
    let appid: String = AppConfig.KEYS.apiKey
}
