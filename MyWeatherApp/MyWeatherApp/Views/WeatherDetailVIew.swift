//
//  WeatherDetailVIew.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/14/23.
//

import SwiftUI

struct WeatherDetailVIew: View {
    
    var forecastday: Forecastday
    var isNight: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Text("\(forecastday.date)")
                .foregroundColor(isNight ? .white : .black)
                .font(.system(size: 16, weight: .medium))
                .padding(.bottom, 2)
        }
    }
}

//struct WeatherDetailVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailVIew()
//    }
//}
