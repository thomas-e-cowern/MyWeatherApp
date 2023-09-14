//
//  MainWeatherView.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/12/23.
//

import SwiftUI

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Double
    var isNight: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature, specifier: "%.1f")°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(isNight ? .white : .black)
        }
        .padding(.bottom, 40)
    }
}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView(imageName: "weather/64x64/day/113", temperature: 89, isNight: false)
    }
}
