//
//  Networking.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/13/23.
//

import Foundation

struct Networking {
    
    let apiKey = (Bundle.main.infoDictionary?["WS_API_KEY"] as? String)!
    
    func getCurrentWeather() async throws -> Welcome {
        print("Inside Networking")
        let currentWeatherEndpoint = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=33417&aqi=no"
        print("\(currentWeatherEndpoint)")
        guard let url = URL(string: currentWeatherEndpoint) else {
            print("Inside url")
            throw WAPIErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Response error")
            throw WAPIErrors.invalidResponse
        }
        print("response: \(data)")
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let decodedData = try decoder.decode(WeatherAPIResponse.self, from: data)
            let welcome = try JSONDecoder().decode(Welcome.self, from: data)
            print("Decoded: \(String(describing: welcome))")
            return welcome
        } catch {
            print("Decode error: \(error)")
            throw WAPIErrors.invalidData
        }
    }
}
