//
//  WeatherAPIErrors.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/13/23.
//

import Foundation

enum WAPIErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
