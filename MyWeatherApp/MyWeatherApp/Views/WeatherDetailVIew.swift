//
//  WeatherDetailVIew.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/14/23.
//

import SwiftUI

struct WeatherDetailVIew: View {
    
    var forecastday: Forecastday
    
    var body: some View {
        Text(forecastday.date)
    }
}

//struct WeatherDetailVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailVIew()
//    }
//}
