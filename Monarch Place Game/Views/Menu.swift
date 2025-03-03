//
//  Menu.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 28.02.2025.
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("levelNumber") var levelNumber = 1
    @State private var showShop = false
    @State private var showRules = false
    @State private var showSettings = false
    var body: some View {
        ZStack {
            Background(isBlur: false)
            VStack {
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
                Image("levelsFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.0577)
                    .overlay(
                    Text("LEVEL \(levelNumber)/30")
                        .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                        .foregroundColor(.white)
                        .offset(y: -screenHeight*0.005)
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            VStack(spacing: screenHeight*0.04) {
                Image("menuIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.15)
                HStack(spacing: screenHeight*0.04) {
                    Buttons(buttonSize: 0.2, text: "START")
                        .onTapGesture {
                            coordinator.navigate(to: .game)
                        }
                    Buttons(buttonSize: 0.2, text: "SHOP")
                        .onTapGesture {
                            showShop.toggle()
                        }
                }
                HStack(spacing: screenHeight*0.04) {
                    Buttons(buttonSize: 0.2, text: "RULES")
                        .onTapGesture {
                            showRules.toggle()
                        }
                    Buttons(buttonSize: 0.2, text: "SETTINGS")
                        .onTapGesture {
                            showSettings.toggle()
                        }
                }
            }
            if showShop {
                Shop(showShop: $showShop)
            }
            if showRules {
                Rules(showRules: $showRules)
            }
            if showSettings {
                Settings(showSettings: $showSettings)
            }
        }
    }
}

#Preview {
    Menu()
}
