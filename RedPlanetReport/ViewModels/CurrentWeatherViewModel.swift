//
//  CurrentWeatherViewModel.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation

public class CurrentWeatherViewModel: ObservableObject {
    @Published var safe: String = "Unsafe"
    @Published var date: String = "--"
    @Published var temperature: String = "--"
    @Published var humidity: String = "--"
    @Published var windSpeed: String = "--"
    
    
    private let weather: WeatherDataModel
    
    init(weather: WeatherDataModel) {
        self.weather = weather
        refresh()
    }
    
    public func refresh() {

        DispatchQueue.main.async {
            self.safe = self.weather.safe ? "SAFE" : "NOT SAFE"
            self.date = DateHelper.formatDateString(self.weather.date)
            self.temperature = "\(Int(self.weather.temp)) °C"
            self.humidity = "\(self.weather.humidity) %"
            self.windSpeed = "\(self.weather.windSpeed) km/h"
        }
    }
    
}
