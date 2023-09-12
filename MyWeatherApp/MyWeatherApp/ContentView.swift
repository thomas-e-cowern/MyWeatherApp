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
                
                HStack {
                    VStack(spacing: 1) {
                        Text("TUE")
                            .font(.system(size: 24, weight: .medium))
                            .padding(.bottom, 2)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text("86°")
                            .font(.system(size: 32, weight: .light))
                            .padding(.bottom, 2)
                    }
                    .padding()
                    
                    VStack(spacing: 1) {
                        Text("WED")
                            .font(.system(size: 24, weight: .medium))
                            .padding(.bottom, 2)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text("86°")
                            .font(.system(size: 32, weight: .light))
                            .padding(.bottom, 2)
                    }
                    .padding()
                    
                    VStack(spacing: 1) {
                        Text("THU")
                            .font(.system(size: 24, weight: .medium))
                            .padding(.bottom, 2)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text("86°")
                            .font(.system(size: 32, weight: .light))
                            .padding(.bottom, 2)
                    }
                    .padding()
                    
                    VStack(spacing: 1) {
                        Text("FRI")
                            .font(.system(size: 24, weight: .medium))
                            .padding(.bottom, 2)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text("86°")
                            .font(.system(size: 32, weight: .light))
                            .padding(.bottom, 2)
                    }
                    .padding()
                    
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
