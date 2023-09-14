//
//  Networking.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/13/23.
//

import Foundation

struct Networking {
    
    static let shared = Networking()
    
    let apiKey = (Bundle.main.infoDictionary?["WS_API_KEY"] as? String)!
    
    func getCurrentWeather() async throws -> APIResponse {

        let currentWeatherEndpoint = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=33417&aqi=no"

        guard let url = URL(string: currentWeatherEndpoint) else {
            throw WAPIErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WAPIErrors.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            print("Decoded: \(String(describing: apiResponse))")
            return apiResponse
        } catch {
            print("Decode error: \(error)")
            throw WAPIErrors.invalidData
        }
    }
}
