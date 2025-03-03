//
//  Rules.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 03.03.2025.
//

import SwiftUI

struct Rules: View {
    @AppStorage("coinCount") var coinCount = 0
    @Binding var showRules: Bool
    var body: some View {
        ZStack {
            Background(isBlur: false)
            HStack {
                Image("arrowBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .onTapGesture {
                        showRules.toggle()
                    }
                Spacer()
                Image("coinFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .overlay(
                    Text("\(coinCount)")
                        .font(Font.custom("Alata-Regular", size: screenWidth*0.04))
                        .foregroundColor(.white)
                        .offset(x:screenHeight*0.06, y: -screenHeight*0.005)
                    )
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            Image("rulesFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.35)
                .offset(y: screenWidth*0.02)
        }
    }
}

#Preview {
    Rules(showRules: .constant(true))
}
