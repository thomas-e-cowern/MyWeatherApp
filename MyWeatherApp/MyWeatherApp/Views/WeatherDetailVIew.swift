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
            
            VStack {
                Text("Forecast for \(getDayOfWeek(forecastday.date))")
                    .foregroundColor(isNight ? .white : .black)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
                
                MainWeatherView(imageName: getWeatherIconSubstring(string: forecastday.day.condition.icon), temperature: forecastday.day.avgtempF, isNight: isNight)
                
                HStack {
                    Image(systemName: "thermometer.low")
                    Text("\(forecastday.day.mintempF, specifier: "%.1f")°")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                    
                    Spacer()
                        .frame(width: 120)
                    
                    Image(systemName: "thermometer.high")
                    Text("\(forecastday.day.maxtempF, specifier: "%.1f")°")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                }
                
                Divider()
                
                HStack {
                    Image(systemName: "wind")
                    Text("\(forecastday.day.maxwindMph, specifier: "%.1f")mph")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                    
                    Spacer()
                        .frame(width: 100)
                    
                    Image(systemName: "drop")
                    Text("\(forecastday.day.totalprecipIn, specifier: "%.1f")in")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                }
                
                Divider()
                
                HStack {
                    Image(systemName: "humidity")
                    Text("\(forecastday.day.avghumidity, specifier: "%.1f")%")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                    
                    Spacer()
                        .frame(width: 100)
                    
                    Image(systemName: "eye")
                    Text("\(forecastday.day.totalprecipIn, specifier: "%.1f")mi")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                }
                
                Divider()
                
                HStack {
                    Text("Chance of Rain: ")
                    Text("\(forecastday.day.dailyChanceOfRain, specifier: "%.1f")%")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(isNight ? .white : .black)
                }
                
                Spacer()
            }
        }
    }
    
    func getDayOfWeek(_ date:String) -> String {
        
        let weekDays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]

        let formatter  = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        guard let myDate = formatter.date(from: date) else { return "Date Error" }
        
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: myDate)
        
        
        return weekDays[weekDay-1]
    }
    
    func getWeatherIconSubstring(string: String) -> String {
        let start = string.dropFirst(21)
        let end = start.dropLast(4)
        let stringImage = String(end)
        print(stringImage)
        return stringImage
    }
}

//struct WeatherDetailVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailVIew()
//    }
//}
