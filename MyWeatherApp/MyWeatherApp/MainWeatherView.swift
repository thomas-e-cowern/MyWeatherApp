//
//  MainWeatherView.swift
//  MyWeatherApp
//
//  Created by Thomas Cowern on 9/12/23.
//

import SwiftUI

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
        }
        .padding(.bottom, 40)
    }
}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView(imageName: "cloud.sun.fill", temperature: 89)
    }
}
