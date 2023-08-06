//
//  ForecastDataModel.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation

//data model depicting the forcaste data reponse recived from NASA MARS API
struct ForecastDataModel: Decodable {
    let forecasts: [WeatherDataModel]
    let lastUpdated: String
    let weatherStation: String
}
