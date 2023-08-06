//
//  MarsWeatherManager.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation
import Combine

class MarsWeatherManager: ObservableObject {
    static let shared = MarsWeatherManager()

    @Published private(set) var forecasts: [WeatherDataModel] = []
    @Published private(set) var lastUpdated: String?
    @Published private(set) var weatherStation: String?

    private init() {
        // Fetch data from the API and update properties
        fetchWeatherData()
    }

    public func fetchWeatherData() {
        // Upon successful API response, update the properties
        // forecasts, lastUpdated, and weatherStation with the fetched data
        guard let urlString = "https://run.mocky.io/v3/1fd068d7-cbb2-4ceb-b697-da7fcc1c520b".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { return }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else{
                //handle error
                print("ERROR \(String(describing: error))")
                return
            }
            
            if let response = try? JSONDecoder().decode(ForecastDataModel.self, from: data) {
                DispatchQueue.main.async {
                    self.forecasts = response.forecasts
                    self.lastUpdated = DateHelper.formatDateString(response.lastUpdated)
                    self.weatherStation = response.weatherStation
                    print("Successfull")
                }
            }
        }.resume()
    }
}

