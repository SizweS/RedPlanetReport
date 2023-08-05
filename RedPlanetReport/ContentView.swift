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
        VStack {
            Text(viewModel.safe)
                .font(.largeTitle)
                .padding()
            Text(viewModel.date)
            Text(viewModel.temperature)
                .font(.system(size:100))
                .bold()
            HStack {
                VStack {
                    Text(viewModel.humidity)
                        .bold()
                    Text("Humidity")
                }
                VStack {
                    Text(viewModel.windSpeed)
                        .bold()
                    Text("Wind speed")
                }
            }
            
        }.onAppear(perform: viewModel.refresh)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(marsWeatherService: MarsWeatherService()))
    }
}
