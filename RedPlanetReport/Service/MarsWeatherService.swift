//
//  MarsWeatherService.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation

public final class MarsWeatherService: NSObject {
    
    private var completionHandler: ((Forecast) -> Void)?
    
    public func loadWeatherData(_ completionHandler: @escaping((Forecast) -> Void)) {
        self.completionHandler = completionHandler
        getWeatherData()
    }
    
    private func getWeatherData() {
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
                self.completionHandler?(Forecast(marsForcasts: response))
            }
        }.resume()
    }
}
