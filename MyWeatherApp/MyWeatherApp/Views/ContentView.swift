//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    let apiKey = (Bundle.main.infoDictionary?["WS_API_KEY"] as? String)!
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "West Palm Beach", isNight: isNight)
                
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 89, isNight: isNight)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.heavyrain.fill", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.fill", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.sun.fill", temperature: 78, isNight: isNight)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                    let apiKey = (Bundle.main.infoDictionary?["WS_API_KEY"] as? String)!
                    print("\(isNight)")
                    print(apiKey)
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
