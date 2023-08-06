//
//  ContentView.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {

        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Today's weather")
                    Spacer()
                    Image(systemName: "arrow.down")
                }
                if let currentWeather = viewModel.currentWeather {
                    CurrentWeather(currentWeatherViewModel: CurrentWeatherViewModel(weather: currentWeather))
                } else {
                    Text("No weather data available")
                }
                HStack {
                    Text("Weekly forecast")
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack{
                        if let forecast = viewModel.forecast {
                            ForEach(forecast.indices.dropFirst(), id: \.self) { index in
                                    CurrentWeather(currentWeatherViewModel: CurrentWeatherViewModel(weather: forecast[index]))
                                .padding()
                            }
                        } else {
                            Text("No forecast weather data available")
                        }
                    }
                }
                
                HStack{
                    if let lastUpdated = viewModel.lastUpdated {
                        Text("Last Updated: \(lastUpdated)")
                            .font(.system(size: 10))
                    } else {
                        Text("no Updates")
                    }
                    Spacer()
                    if let weatherStation = viewModel.weatherStation {
                        Text(weatherStation)
                            .font(.system(size: 10))
                    } else {
                        Text("")
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
