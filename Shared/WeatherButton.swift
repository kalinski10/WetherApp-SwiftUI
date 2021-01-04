//
//  WeatherButton.swift
//  WetherApp-SwiftUI
//
//  Created by Kalin Balabanov on 13/12/2020.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    
    var body: some View {
        WTitleText(title: title, textsize: 20, textColor: textColor, textWeight: .bold)
            .frame(width: 280, height: 50, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
    }
}
