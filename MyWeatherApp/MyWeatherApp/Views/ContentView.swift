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
    let networking = Networking()
    @State private var currentWeather: APIResponse? = nil
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "\(currentWeather?.location.name ?? "")", isNight: isNight)
                
                MainWeatherView(imageName: "cloud.sun.fill", temperature: Int(currentWeather?.current.tempF ?? 0), isNight: isNight)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.heavyrain.fill", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.fill", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind", temperature: 78, isNight: isNight)
                    
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.sun.fill", temperature: 78, isNight: isNight)
                }
                
                Spacer()
                
                Button {
                    print("Button Clicked")
                    isNight.toggle()
                    Task {
                        await getCurrentWeather()
                    }
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
    
    func getCurrentWeather() async {
        do {
            currentWeather = try await networking.getCurrentWeather()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
