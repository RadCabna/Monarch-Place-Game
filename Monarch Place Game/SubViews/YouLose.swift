//
//  YouLose.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 01.03.2025.
//

import SwiftUI

struct YouLose: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @Binding var youLose: Bool
    var body: some View {
        Image("loseFrame")
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*0.3)
            .overlay(
                VStack {
                   
                    Buttons(buttonSize: 0.15, text: "RESTART")
                        .onTapGesture {
                            youLose.toggle()
                        }
                    Buttons(buttonSize: 0.15, text: "MENU")
                        .onTapGesture {
                            coordinator.navigate(to: .main)
                        }
                }
                    .offset(y: screenWidth*0.03)
            )
    }
}

#Preview {
    YouLose(youLose: .constant(true))
}
