//
//  TodaysWeather.swift
//  WetherApp-SwiftUI
//
//  Created by Kalin Balabanov on 13/12/2020.
//

import Foundation

enum WeatherSymbols: String {
    case cloud = "cloud.fill"
    case cloudDrizzle = "cloud.drizzle.fill"
    case cloudSnow = "cloud.snow.fill"
    case cloudHail = "cloud.hail.fill"
    case snow = "snow"
    case sun = "sun.max.fill"
    case moon = "moon.stars.fill"
}


enum Day: String {
    case mon = "MON"
    case tue = "TUE"
    case wed = "WED"
    case thu = "THU"
    case fri = "FRI"
    case sat = "SAT"
    case sun = "SUN"
}

struct TodaysWeather {
    var day: Day
    var symbol: WeatherSymbols
    var temperature: Int
    
    // create functions for randomised views
    
}
