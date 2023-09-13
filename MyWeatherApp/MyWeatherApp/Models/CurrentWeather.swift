//
//  CurrentWeather.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/13/23.
//

import Foundation

struct Location: Codable {
    var name: String
}

struct Current: Codable {
    var temp_c: Double
    var temp_f: Double
}

struct Condition: Codable {
    var text: String
    var icon: String
    var code: Int
}

struct WeatherAPIResponse: Codable {
    var location: Location
    var current: Current
    var condition: Condition
}
