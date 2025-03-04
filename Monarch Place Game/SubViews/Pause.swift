//
//  Pause.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 04.03.2025.
//

import SwiftUI

struct Pause: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var showPause: Bool
    var body: some View {
       Image("pauseFrame")
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*0.25)
            .overlay(
                VStack {
                    Buttons(buttonSize: 0.13, text: "CONTINUE")
                        .onTapGesture {
                            showPause.toggle()
                        }
                    Buttons(buttonSize: 0.13, text: "MENU")
                        .onTapGesture {
                            coordinator.navigate(to: .main)
                        }
                }
                    .offset(y: screenWidth*0.025)
            )
    }
}

#Preview {
    Pause(showPause: .constant(true))
}
