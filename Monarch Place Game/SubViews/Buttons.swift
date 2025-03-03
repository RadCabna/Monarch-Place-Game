//
//  Buttons.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 28.02.2025.
//

import SwiftUI

struct Buttons: View {
    var buttonSize: CGFloat = 0.2
    var text = "START"
    var body: some View {
        Image("menuButton")
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*0.5*buttonSize)
            .overlay(
            Text(text)
                .font(Font.custom("Alata-Regular", size: screenWidth*0.5*0.5*buttonSize))
                .foregroundColor(.white)
                .offset(y:-screenHeight*0.02*buttonSize)
            )
    }
}

#Preview {
    Buttons()
}
