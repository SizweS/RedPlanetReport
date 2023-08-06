//
//  ContentViewModel.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import SwiftUI
import Combine

public class ContentViewModel: ObservableObject {
    @Published var currentWeather: WeatherDataModel?
    @Published var forecast: [WeatherDataModel]?
    @Published var lastUpdated: String?
    @Published var weatherStation: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        observeWeatherData()
    }
    
    private func observeWeatherData() {
        MarsWeatherManager.shared.$forecasts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] forecasts in
                self?.forecast = forecasts
                self?.currentWeather = forecasts.first
            }
            .store(in: &cancellables)
        
        MarsWeatherManager.shared.$lastUpdated
             .assign(to: \.lastUpdated, on: self)
             .store(in: &cancellables)
         
         MarsWeatherManager.shared.$weatherStation
             .assign(to: \.weatherStation, on: self)
             .store(in: &cancellables)
    }
    
    // Add a method to refresh the data when needed
    public func refreshWeatherData() {
        MarsWeatherManager.shared.fetchWeatherData()
    }
}








