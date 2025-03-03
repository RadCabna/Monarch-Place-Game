//
//  Loading.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 28.02.2025.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var coordinator: Coordinator
    @State private var loadingProgress: CGFloat = 1
    var body: some View {
        ZStack {
            Background(isBlur: true)
            VStack {
                Image("butterfly")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*0.6)
                Text("LOADING...")
                    .font(Font.custom("Alata-Regular", size: screenHeight*0.07))
                    .foregroundColor(.white)
                Image("loadingLineBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*0.06)
                    .overlay(
                        Image("loadingLineFront")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenHeight*0.053)
                            .offset(x: -screenWidth*0.35*loadingProgress)
                            .mask(
                                Image("loadingLineFront")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenHeight*0.053)
                            )
                    )
            }
        }
        
        .onAppear {
            loadingAnimation()
        }
        
    }
    
    func loadingAnimation() {
        withAnimation(Animation.easeInOut(duration: 3)) {
            loadingProgress = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            coordinator.navigate(to: .main)
        }
    }
    
}

#Preview {
    Loading()
}
