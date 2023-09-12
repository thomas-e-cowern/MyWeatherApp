//
//  WeatherDayView.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/12/23.
//

import Foundation
import SwiftUI

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var isNight: Bool
    
    var body: some View {
        VStack(spacing: 1) {
            Text(dayOfWeek)
                .foregroundColor(isNight ? .white : .black)
                .font(.system(size: 16, weight: .medium))
                .padding(.bottom, 2)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)")
                .foregroundColor(isNight ? .white : .black)
                .font(.system(size: 28, weight: .light))
                .padding(.bottom, 2)
        }
    }
}
