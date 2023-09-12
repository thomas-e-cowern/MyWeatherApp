//
//  CityTextView.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/12/23.
//

import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .padding()
    }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
        CityTextView(cityName: "Miami, Fl")
    }
}
