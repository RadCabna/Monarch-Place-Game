//
//  YouWin.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 01.03.2025.
//

import SwiftUI

struct YouWin: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @Binding var youWin: Bool
    var body: some View {
        Image("winFrame")
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*0.34)
            .overlay(
                VStack {
                    Image("coinFrame")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.06)
                        .overlay(
                        Text("+10")
                            .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                            .foregroundColor(.white)
                            .offset(x:screenHeight*0.06, y: -screenHeight*0.005)
                        )
                    Buttons(buttonSize: 0.15, text: "NEXT LEVEL")
                        .onTapGesture {
                            coinCount += 10
                            youWin.toggle()
                        }
                    Buttons(buttonSize: 0.15, text: "MENU")
                        .onTapGesture {
                            coinCount += 10
                            coordinator.navigate(to: .main)
                        }
                }
                    .offset(y: screenWidth*0.03)
            )
    }
}

#Preview {
    YouWin(youWin: .constant(true))
}
