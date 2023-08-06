//
//  WeatherDataModel.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation

// Data model depicting weather details on a particular day
struct WeatherDataModel: Decodable {
    let date: String
    let temp: Double
    let humidity: Int
    let windSpeed: Int
    let safe: Bool
}
