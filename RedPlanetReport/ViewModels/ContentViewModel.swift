//
//  ContentViewModel.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation


public class ContentViewModel: ObservableObject {
    @Published var safe: String = "Unsafe"
    @Published var date: String = "--"
    @Published var temperature: String = "--"
    @Published var humidity: String = "--"
    @Published var windSpeed: String = "--"
    
    public let marsWeatherService: MarsWeatherService
    
    public init(marsWeatherService: MarsWeatherService) {
        self.marsWeatherService = marsWeatherService
    }
    
    public func refresh() {
        marsWeatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.safe = weather.marsForcasts.forecasts[0].safe ? "SAFE" : "NOT SAFE"
                self.date = weather.marsForcasts.forecasts[0].date
                self.temperature = "\(weather.marsForcasts.forecasts[0].temp) °C"
                self.humidity = "\(weather.marsForcasts.forecasts[0].humidity) %"
                self.windSpeed = "\(weather.marsForcasts.forecasts[0].humidity) km/h"
            }
        }
    }
}
