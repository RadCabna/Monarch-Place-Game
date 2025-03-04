//
//  Loading.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 28.02.2025.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("levelInfo") var level = false
    @State private var loadingProgress: CGFloat = 1
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                let isLandscape = width > height
                if isLandscape {
                    Background(isBlur: true)
                    VStack {
                        Image("butterfly")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height*0.6)
                        Text("LOADING...")
                            .font(Font.custom("Alata-Regular", size: height*0.07))
                            .foregroundColor(.white)
                        Image("loadingLineBack")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height*0.06)
                            .overlay(
                                Image("loadingLineFront")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: height*0.053)
                                    .offset(x: -width*0.35*loadingProgress)
                                    .mask(
                                        Image("loadingLineFront")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: height*0.053)
                                    )
                            )
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    Background(isBlur: true)
                    VStack {
                        Image("butterfly")
                            .resizable()
                            .scaledToFit()
                            .frame(height: width*0.6)
                        Text("LOADING...")
                            .font(Font.custom("Alata-Regular", size: width*0.07))
                            .foregroundColor(.white)
                        Image("loadingLineBack")
                            .resizable()
                            .scaledToFit()
                            .frame(height: width*0.06)
                            .overlay(
                                Image("loadingLineFront")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: width*0.053)
                                    .offset(x: -height*0.35*loadingProgress)
                                    .mask(
                                        Image("loadingLineFront")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: width*0.053)
                                    )
                            )
                    }
                    .rotationEffect(Angle(degrees: -90))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
        
        .onChange(of: level) { _ in
            if level {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    coordinator.navigate(to: .main)
                }
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
    }
    
}

#Preview {
    Loading()
}
