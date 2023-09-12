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
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("West Palm Beach, FL")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("89°")
                        .font(.system(size: 70, weight: .medium))
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.heavyrain.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.sun.fill", temperature: 78)
                    
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


