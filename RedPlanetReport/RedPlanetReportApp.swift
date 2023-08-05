//
//  RedPlanetReportApp.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import SwiftUI

@main
struct RedPlanetReportApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = MarsWeatherService()
            let viewModel = ContentViewModel(marsWeatherService: weatherService)
            ContentView(viewModel: viewModel)
        }
    }
}
