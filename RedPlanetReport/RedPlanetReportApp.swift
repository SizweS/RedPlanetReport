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
            let viewModel = ContentViewModel()
            ContentView(viewModel: viewModel)
                .foregroundColor(Color(UIColor(red: 69/255, green: 24/255, blue: 4/255, alpha: 1.0)))
        }
    }
}
