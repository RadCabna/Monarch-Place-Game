//
//  Settings.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 03.03.2025.
//

import SwiftUI

struct Settings: View {
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("music") var music = true
    @AppStorage("sound") var sound = true
    @AppStorage("vibration") var vibration = true
    @Binding var showSettings: Bool
    var body: some View {
        ZStack {
            Background(isBlur: false)
            HStack {
                Image("arrowBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .onTapGesture {
                        showSettings.toggle()
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
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.37)
                .overlay(
                    VStack {
                        HStack(spacing: screenWidth*0.04) {
                            VStack(spacing: screenWidth*0.01) {
                                Text("MUSIC")
                                    .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                    .foregroundColor(.white)
                                Toggle("", isOn: $music)
                                    .toggleStyle(CustomToggle())
                            }
                            VStack(spacing: screenWidth*0.01) {
                                Text("SOUND")
                                    .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                    .foregroundColor(.white)
                                Toggle("", isOn: $sound)
                                    .toggleStyle(CustomToggle())
                            }
                        }
                        VStack(spacing: screenWidth*0.01) {
                            Text("VIBRATION")
                                .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                .foregroundColor(.white)
                            Toggle("", isOn: $vibration)
                                .toggleStyle(CustomToggle())
                        }
                        Image("rateUsButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenWidth*0.04)
                            .padding(.top)
                    }
                        .offset(y: screenWidth*0.02)
                )
                .offset(y: screenWidth*0.02)
        }
    }
}

#Preview {
    Settings(showSettings: .constant(true))
}

struct CustomToggle: ToggleStyle {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            ZStack {
                Image("toggleBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.035)
            }
//            .opacity(configuration.isOn ? 1 : 0.3)
            .overlay(
                ZStack {
                    Image(configuration.isOn ? "toggleOn" : "toggleOff")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.033)
                        .offset(x: configuration.isOn ? screenWidth*0.0297 : -screenWidth*0.0297)
                        .animation(.easeInOut, value: configuration.isOn)
                   
                   
                }
            )
        }
    }
}
