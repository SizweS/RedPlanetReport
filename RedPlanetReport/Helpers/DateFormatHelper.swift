//
//  DateFormatHelper.swift
//  RedPlanetReport
//
//  Created by Sizwe Maluleke on 2023/08/05.
//

import Foundation

class DateHelper {
    static func formatDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEEE, d MMMM"
            return dateFormatter.string(from: date)
        }
        return "Invalid Date"
    }
}
