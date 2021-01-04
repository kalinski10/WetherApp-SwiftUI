//
//  ContentView.swift
//  Shared
//
//  Created by Kalin Balabanov on 13/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    let days: [TodaysWeather] = [TodaysWeather(day: .mon, symbol: .cloud, temperature: 12),
                                 TodaysWeather(day: .tue, symbol: .cloudHail, temperature: 6),
                                 TodaysWeather(day: .wed, symbol: .snow, temperature: 2),
                                 TodaysWeather(day: .thu, symbol: .snow, temperature: 0),
                                 TodaysWeather(day: .fri, symbol: .snow, temperature: -2),
                                 TodaysWeather(day: .sat, symbol: .snow, temperature: -4)]
    
    @State private var isNightMode = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNightMode: $isNightMode, topColour: .blue, bottomColour: Color("lightBlue"))
            
            VStack(spacing: 20) {
                WTitleText(title: "Cupertino, CA", textsize: 32, textColor: .white, textWeight: .medium)
                    .padding(.bottom, 20)
                    .padding(.top, 40)
                
                VStack(spacing: 10) {
                    WSymbol(symbol: isNightMode ? .moon : .sun, symbolFrame: 180)
                    WTitleText(title: "24°", textsize: 70, textColor: .white, textWeight: .medium)
                        .padding(.bottom, 20)
                    
                    HStack {
                        WeatherDaysVStackItem(today: days[0])
                        WeatherDaysVStackItem(today: days[1])
                        WeatherDaysVStackItem(today: days[2])
                        WeatherDaysVStackItem(today: days[3])
                        WeatherDaysVStackItem(today: days[4])
                    }
                }
                
                Spacer()
                
                Button {
                    isNightMode.toggle()
                } label: {
                    WeatherButton(title: "Change time of day", textColor: .blue)
                }
            
                Spacer()
            }
        }
    }
}

struct ContentView_Preiews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNightMode: Bool
    
    var topColour: Color
    var bottomColour: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNightMode ? .black : .blue, isNightMode ? .gray : bottomColour]),
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WSymbol: View {
    
    var symbol: WeatherSymbols
    var symbolFrame: CGFloat
    
    var body: some View {
        Image(systemName: symbol.rawValue)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: symbolFrame, height: symbolFrame, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}


struct WTitleText: View {
    
    var title: String
    var textsize: CGFloat
    var textColor: Color
    var textWeight: Font.Weight
    
    var body: some View {
        Text(title)
            .font(.system(size: textsize, weight: textWeight))
            .foregroundColor(textColor)
    }
}


struct WeatherDaysVStackItem: View {
    
    var today: TodaysWeather
    
    var body: some View {
        
        VStack {
            WTitleText(title: today.day.rawValue, textsize: 20, textColor: .white, textWeight: .medium)
            WSymbol(symbol: today.symbol, symbolFrame: 60)
            Text("\(today.temperature)°")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
    }
}
