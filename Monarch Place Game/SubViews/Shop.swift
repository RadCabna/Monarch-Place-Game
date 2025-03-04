//
//  Shop.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 03.03.2025.
//

import SwiftUI

struct Shop: View {
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("whatButterfly") var whatButterfly = 0
    @AppStorage("whatFlag") var whatFlag = 0
    @State private var butterflyDataArray = UserDefaults.standard.array(forKey: "butterflyDataArray") as? [Int] ?? [2,0,0,0]
    @State private var flagDataArray = UserDefaults.standard.array(forKey: "flagDataArray") as? [Int] ?? [2,0,0,0]
    @State private var butterflyShopArray = Arrays.butterflyShopArray
    @State private var flagShopArray = Arrays.flagShopArray
    @State private var shopSetNumber = 1
    @State private var setOneOffset: CGFloat = 0
    @State private var setTwoOffset: CGFloat = 0
    @Binding var showShop: Bool
    var body: some View {
        ZStack {
            Background(isBlur: false)
            HStack {
                Image("arrowBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .onTapGesture {
                        showShop.toggle()
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
            Group {
                Image("shopFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.32)
                    .overlay(
                        ZStack {
                            HStack {
                                ForEach(0..<butterflyShopArray.count, id: \.self) { item in
                                    VStack {
                                        Image(butterflyShopArray[item].itemImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: screenWidth*0.16)
                                        if butterflyDataArray[item] == 2 {
                                            VStack(spacing: screenWidth*0.005) {
                                                Text("PURCHASED")
                                                    .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                    .foregroundColor(.white)
                                                Image("selectedButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                        } else if butterflyDataArray[item] == 1 {
                                            VStack(spacing: screenWidth*0.005) {
                                                Text("PURCHASED")
                                                    .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                    .foregroundColor(.white)
                                                Image("selectButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                            .onTapGesture {
                                                selectButterfly(item: item)
                                            }
                                        } else if butterflyDataArray[item] == 0 && coinCount >= butterflyShopArray[item].itemCost {
                                            VStack(spacing: screenWidth*0.005) {
                                                HStack {
                                                    Image("coin")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: screenWidth*0.02)
                                                    Text("\(butterflyShopArray[item].itemCost)")
                                                        .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                        .foregroundColor(.white)
                                                }
                                                Image("buyButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                                    .onTapGesture {
                                                        buyButterfly(item: item)
                                                        coinCount -= butterflyShopArray[item].itemCost
                                                    }
                                            }
                                        } else if butterflyDataArray[item] == 0 && coinCount < butterflyShopArray[item].itemCost {
                                            VStack(spacing: screenWidth*0.005) {
                                                HStack {
                                                    Image("coin")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: screenWidth*0.02)
                                                    Text("\(butterflyShopArray[item].itemCost)")
                                                        .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                        .foregroundColor(.white)
                                                }
                                                Image("noBuyButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                        }
                                    }
                                }
                                .offset(y: screenWidth*0.02)
                            }
                            .offset(x: setOneOffset)
                            HStack {
                                ForEach(0..<flagShopArray.count, id: \.self) { item in
                                    VStack {
                                        Image(flagShopArray[item].itemImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: screenWidth*0.16)
                                        if flagDataArray[item] == 2 {
                                            VStack(spacing: screenWidth*0.005) {
                                                Text("PURCHASED")
                                                    .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                    .foregroundColor(.white)
                                                Image("selectedButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                        } else if flagDataArray[item] == 1 {
                                            VStack(spacing: screenWidth*0.005) {
                                                Text("PURCHASED")
                                                    .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                    .foregroundColor(.white)
                                                Image("selectButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                                    .onTapGesture {
                                                        selectFlag(item: item)
                                                    }
                                            }
                                            .onTapGesture {
                                                selectButterfly(item: item)
                                            }
                                        } else if flagDataArray[item] == 0 && coinCount >= flagShopArray[item].itemCost {
                                            VStack(spacing: screenWidth*0.005) {
                                                HStack {
                                                    Image("coin")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: screenWidth*0.02)
                                                    Text("\(flagShopArray[item].itemCost)")
                                                        .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                        .foregroundColor(.white)
                                                }
                                                Image("buyButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                                    .onTapGesture {
                                                        buyFlag(item: item)
                                                        coinCount -= flagShopArray[item].itemCost
                                                    }
                                            }
                                        } else if flagDataArray[item] == 0 && coinCount < flagShopArray[item].itemCost {
                                            VStack(spacing: screenWidth*0.005) {
                                                HStack {
                                                    Image("coin")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: screenWidth*0.02)
                                                    Text("\(flagShopArray[item].itemCost)")
                                                        .font(Font.custom("Alata-Regular", size: screenWidth*0.02))
                                                        .foregroundColor(.white)
                                                }
                                                Image("noBuyButton")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                        }
                                    }
                                }
                                .offset(y: screenWidth*0.02)
                            }
                            .offset(x: setTwoOffset)
                        }
                            .mask(
                                Rectangle()
                                    .frame(width: screenWidth*0.575, height: screenWidth*0.3)
                            )
                    )
                if shopSetNumber == 1 {
                    HStack {
                        Spacer()
                            .frame(width: screenWidth*0.73)
                        Image("toFlags")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenWidth*0.1)
                            .onTapGesture {
                                changeShopSetAnimation()
                            }
                    }
                    .padding(.horizontal)
                } else {
                    HStack {
                        Image("toButterfly")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenWidth*0.1)
                            .onTapGesture {
                                changeShopSetAnimation()
                            }
                        Spacer()
                            .frame(width: screenWidth*0.73)
                    }
                    .padding(.horizontal)
                }
            }
            .offset(y: screenWidth*0.02)
        }
        
        .onAppear {
            setTwoOffset = screenWidth*0.6
        }
        
    }
    
    func changeShopSetAnimation() {
        if shopSetNumber == 1 {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                setOneOffset = -screenWidth*0.6
                setTwoOffset = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation() {
                    shopSetNumber = 2
                }
            }
        }
        if shopSetNumber == 2 {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                setOneOffset = 0
                setTwoOffset = screenWidth*0.6
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation() {
                    shopSetNumber = 1
                }
            }
        }
    }
    
    func buyButterfly(item: Int) {
        butterflyDataArray[item] = 1
        UserDefaults.standard.setValue(butterflyDataArray, forKey: "butterflyDataArray")
    }
    
    func selectButterfly(item: Int) {
        for i in 0..<butterflyDataArray.count {
            if butterflyDataArray[i] == 2 {
                butterflyDataArray[i] = 1
            }
        }
        butterflyDataArray[item] = 2
        UserDefaults.standard.setValue(butterflyDataArray, forKey: "butterflyDataArray")
        whatButterfly = item
    }
    
    func buyFlag(item: Int) {
        flagDataArray[item] = 1
        UserDefaults.standard.setValue(flagDataArray, forKey: "flagDataArray")
    }
    
    func selectFlag(item: Int) {
        for i in 0..<flagDataArray.count {
            if flagDataArray[i] == 2 {
                flagDataArray[i] = 1
            }
        }
        flagDataArray[item] = 2
        UserDefaults.standard.setValue(flagDataArray, forKey: "flagDataArray")
        whatFlag = item
    }
}

#Preview {
    Shop(showShop: .constant(true))
}
