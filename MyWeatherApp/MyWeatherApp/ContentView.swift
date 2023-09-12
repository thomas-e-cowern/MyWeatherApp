//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "West Palm Beach")
                
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 89)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.heavyrain.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.sun.fill", temperature: 78)
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
