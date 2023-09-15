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
    let networking = Networking.shared
    @State private var currentWeather: APIResponse? = nil
    @State private var forecast: APIResponse? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(isNight: $isNight)
                
                VStack {
                    CityTextView(cityName: "\(currentWeather?.location.name ?? "Getting Your Location")", isNight: isNight)
                    
                    MainWeatherView(imageName: getWeatherIconSubstring(string: currentWeather?.current.condition.icon ?? "weather/64x64/day/113"), temperature: Double(currentWeather?.current.tempF ?? 0.0), isNight: isNight)
                    
                    HStack(spacing: 40) {
                        
                        ForEach(0...2, id: \.self) { day in
                            
                            NavigationLink {
                                if let currentWeather = currentWeather {
                                    WeatherDetailVIew(forecastday: currentWeather.forecast.forecastday[day], isNight: isNight)
                                }
                                
                            } label: {
                                WeatherDayView(dayOfWeek: getDayOfWeek(currentWeather?.forecast.forecastday[day].date ?? "2000-01-01"), imageName: getWeatherIconSubstring(string: currentWeather?.current.condition.icon ?? "weather/64x64/day/113"), temperature: currentWeather?.forecast.forecastday[day].day.maxtempF ?? 0.0, isNight: isNight)
                            }
                        }
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
            .task {
                await getCurrentWeather()
            }
        }
        .tint(Color.white)
    }
    
    func getCurrentWeather() async {
        do {
            currentWeather = try await networking.getCurrentWeather()
        } catch {
            print(error.localizedDescription)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
