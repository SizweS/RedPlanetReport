//
//  CurrentWeather.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import SwiftUI

struct CurrentWeather: View {
    @ObservedObject var currentWeatherViewModel: CurrentWeatherViewModel

    var body: some View {
        VStack {
            Text(currentWeatherViewModel.safe)
                .font(.largeTitle)
                .padding()
            Text(currentWeatherViewModel.date)
            Text(currentWeatherViewModel.temperature)
                .font(.system(size: 60))
                .bold()
            HStack {
                VStack {
                    Image(systemName: "drop.fill")
                        .font(.system(size: 30))
                    Text(currentWeatherViewModel.humidity)
                        .bold()
                    Text("Humidity")
                }
                VStack {
                    Image(systemName: "wind")
                        .font(.system(size: 30))
                    Text(currentWeatherViewModel.windSpeed)
                        .bold()
                    Text("Wind speed")
                }
            }
        }
        .padding()
        .background(
            Color(currentWeatherViewModel.safe == "SAFE" ? UIColor(red: 188/255, green: 198/255, blue: 160/255, alpha: 0.4) : UIColor(red: 195/255, green: 67/255, blue: 52/255, alpha: 0.4)))
        .cornerRadius(10)
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        if let firstForecast = MarsWeatherManager.shared.forecasts.first {
            CurrentWeather(currentWeatherViewModel: CurrentWeatherViewModel(weather: firstForecast))
        } else {
            Text("No data available")
        }
    }
}
