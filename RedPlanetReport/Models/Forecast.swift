//
//  Forecast.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation

public struct Forecast {
    let marsForcasts: ForecastDataModel
    
    init(marsForcasts: ForecastDataModel) {
        self.marsForcasts = marsForcasts
    }
}
