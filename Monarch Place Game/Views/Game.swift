//
//  Game.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 28.02.2025.
//

import SwiftUI

struct Game: View {
    @AppStorage("levelNumber") var levelNumber = 1
    @AppStorage("flagName") var flagName = "flag1"
    @AppStorage("butterflyName") var butterflyName = "butterfly1"
    @AppStorage("whatButterfly") var whatButterfly = 0
    @AppStorage("whatFlag") var whatFlag = 0
    @State private var lifesCount = 3
    @State private var flagsCount = 1
    @State private var startFlagsCount = 1
    @State private var flagsChosen = false
    @State private var flagFrameShadowRadius: CGFloat = 4
    @State private var flagShadowTimer: Timer?
    @State private var gameArray = Arrays.gameArray1
    @State private var startGameArray = Arrays.gameArray1
    @State private var butterflyRow = 0
    @State private var butterflyCol = 0
    @State private var netRotationDegreze: CGFloat = 0
    @State private var youWin = false
    @State private var youLose = false
    @State private var globalDarkness: CGFloat = 0
    var body: some View {
        ZStack {
            Background(isBlur: true)
            HStack {
                Image("soundsMiniIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .onTapGesture {
                        levelNumber = 1
                    }
                Image("retryMiniIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                Spacer()
                Image("levelsFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .overlay(
                        Text("LEVEL \(levelNumber)/30")
                            .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                            .foregroundColor(.white)
                            .offset(y: -screenWidth*0.002)
                    )
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            VStack {
                Image("lifesFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .overlay(
                        HStack {
                            Image("\(butterflyName)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenWidth*0.04)
                            Text("\(lifesCount)")
                                .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                .foregroundColor(.white)
                        }
                    )
                Image("lifesFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.06)
                    .shadow(color: .white, radius: flagsChosen ? flagFrameShadowRadius : 0)
                    .shadow(color: .white, radius: flagsChosen ? flagFrameShadowRadius : 0)
                    .overlay(
                        HStack {
                            Image("\(flagName)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenWidth*0.04)
                            Text("\(flagsCount)")
                                .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                .foregroundColor(.white)
                        }
                    )
                    .onTapGesture {
                        if flagsCount > 0 {
                            flagsChosen.toggle()
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
            VStack {
                ForEach(0..<gameArray.count, id: \.self) { row in
                    HStack {
                        ForEach(0..<gameArray[row].count, id: \.self) { col in
                            ZStack {
                                Image(gameArray[row][col].cageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.07)
                                if gameArray[row][col].alreadyOpened {
                                    Image("tappedGameCage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.07)
                                }
                                if gameArray[row][col].flowerHere {
                                    Image("flower")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.05)
                                }
                                if gameArray[row][col].butterflyHere {
                                    Image("\(butterflyName)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.05)
                                        .opacity(gameArray[row][col].butterflyOpacity)
                                }
                                if gameArray[row][col].haveFlag {
                                    Image("\(flagName)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.05)
                                }
                                if gameArray[row][col].haveBomb {
                                    Image("net")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.05)
                                        .scaleEffect(x: -1)
                                        .offset(x: -screenHeight*0.1)
                                        .rotationEffect(Angle(degrees: gameArray[row][col].netRotationDegreze))
                                        .offset(x: -screenHeight*0.1)
                                        .opacity(gameArray[row][col].netOpacity)
                                }
                                if col == 0 {
                                    Image(showHorizontalBombCount(row: row, col: col) == 0 ? "mineCountZero" : "mineCountNonZero")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.07)
                                        .overlay(
                                            Text("\(showHorizontalBombCount(row: row, col: col))")
                                                .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                                .foregroundColor(.white)
                                                .shadow(color: .black, radius: 2)
                                        )
                                        .offset(x: -screenWidth*0.08)
                                }
                                if row == 0 {
                                    Image(showVerticalBombCount(row: row, col: col) == 0 ? "mineCountZero" : "mineCountNonZero")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.07)
                                        .overlay(
                                            Text("\(showVerticalBombCount(row: row, col: col))")
                                                .font(Font.custom("Alata-Regular", size: screenWidth*0.03))
                                                .foregroundColor(.white)
                                                .shadow(color: .black, radius: 2)
                                        )
                                        .offset(y: -screenWidth*0.08)
                                }
                            }
                            .onTapGesture {
                                makeStep(row: row, col: col)
                            }
                        }
                    }
                }
            }
            .offset(y: screenWidth*0.07)
            Color.black.ignoresSafeArea().opacity(globalDarkness)
            if youWin {
                YouWin(youWin: $youWin)
            }
            if youLose {
                YouLose(youLose: $youLose)
            }
        }
        
        .onAppear{
            updateLevelData()
            whatFlafWeSelect()
            whatButterflyWeSelect()
        }
        
        .onChange(of: youWin) { _ in
        darknessAnimation()
            if !youWin {
                if levelNumber < 30 {
                    levelNumber += 1
                }
                updateLevelData()
            }
        }
        
        .onChange(of: youLose) { _ in
        darknessAnimation()
            if !youLose {
                restartGame()
            }
        }
        
        .onChange(of: flagsChosen) { _ in
            if flagsChosen {
                startFlagShadowTimer()
            } else {
                flagFrameShadowRadius = 0
                stopFlagShadowTimer()
            }
        }
        
        .onChange(of: flagsCount) { _ in
            if flagsCount == 0 {
                flagsChosen = false
            }
        }
        
        .onChange(of: lifesCount) { _ in
            if lifesCount <= 0 {
                youLose = true
            }
        }
        
        .onChange(of: butterflyRow) { _ in
            if gameArray[butterflyRow][butterflyCol].haveArrow {
                standOnArraow(row: butterflyRow, col: butterflyCol)
            }
            if gameArray[butterflyRow][butterflyCol].flowerHere {
                showAllFlags()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    youWin = true
                }
            }
        }
        
        .onChange(of: butterflyCol) { _ in
            if gameArray[butterflyRow][butterflyCol].haveArrow {
                standOnArraow(row: butterflyRow, col: butterflyCol)
            }
            if gameArray[butterflyRow][butterflyCol].flowerHere {
                showAllFlags()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    youWin = true
                }
            }
        }
        
    }
    
    func whatFlafWeSelect() {
        switch whatFlag {
        case 0:
            flagName = "flag1"
        case 1:
            flagName = "flag2"
        case 2:
            flagName = "flag3"
        case 3:
            flagName = "flag4"
        default:
            flagName = "flag1"
            
        }
    }
    
    func whatButterflyWeSelect() {
        switch whatButterfly {
        case 0:
            butterflyName = "butterfly1"
        case 1:
            butterflyName = "butterfly2"
        case 2:
            butterflyName = "butterfly3"
        case 3:
            butterflyName = "butterfly4"
        default:
            butterflyName = "butterfly1"
        }
    }
    
    func makeMistake() {
        lifesCount -= 1
        gameArray = startGameArray
        flagsCount = startFlagsCount
        butterflyRow = 0
        butterflyCol = 0
    }
    
    func restartGame() {
        gameArray = startGameArray
        flagsCount = startFlagsCount
        butterflyRow = 0
        butterflyCol = 0
        lifesCount = 3
    }
    
    func updateLevelData() {
        lifesCount = 3
        butterflyRow = 0
        butterflyCol = 0
        switch levelNumber {
        case 1:
            flagsCount = 1
            startFlagsCount = 1
            gameArray = Arrays.gameArray1
            startGameArray = Arrays.gameArray1
        case 2:
            flagsCount = 1
            startFlagsCount = 1
            gameArray = Arrays.gameArray2
            startGameArray = Arrays.gameArray2
        case 3:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray3
            startGameArray = Arrays.gameArray3
        case 4:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray4
            startGameArray = Arrays.gameArray4
        case 5:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray5
            startGameArray = Arrays.gameArray5
        case 6:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray6
            startGameArray = Arrays.gameArray6
        case 7:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray7
            startGameArray = Arrays.gameArray7
        case 8:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray8
            startGameArray = Arrays.gameArray8
        case 9:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray9
            startGameArray = Arrays.gameArray9
        case 10:
            flagsCount = 4
            startFlagsCount = 4
            gameArray = Arrays.gameArray10
            startGameArray = Arrays.gameArray10
        default:
            flagsCount = 1
            startFlagsCount = 1
            gameArray = Arrays.gameArray1
            startGameArray = Arrays.gameArray1
        }
    }
    
    func darknessAnimation() {
        if youLose || youWin {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                globalDarkness = 0.5
            }
        } else {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                globalDarkness = 0
            }
        }
    }
    
    func catchButterflyByNet(row: Int, col: Int) {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                gameArray[row][col].netRotationDegreze = 180
            }
    }
    
    func showAllFlags() {
        for i in 0..<gameArray.count {
            for j in 0..<gameArray[i].count {
                if gameArray[i][j].haveBomb {
                    gameArray[i][j].netOpacity = 1
                    gameArray[i][j].netRotationDegreze = 180
                }
            }
        }
    }
    
    func makeStep (row: Int, col: Int) {
        if flagsChosen {
            if !gameArray[row][col].haveFlag && !gameArray[row][col].alreadyOpened && !gameArray[row][col].butterflyHere && !gameArray[row][col].flowerHere && flagsCount > 0 {
                gameArray[row][col].haveFlag = true
                flagsCount -= 1
            } else if gameArray[row][col].haveFlag{
                gameArray[row][col].haveFlag = false
                flagsCount += 1
            }
        } else if (abs(col - butterflyCol) == 1 && abs(row - butterflyRow) == 0) ||
                    (abs(col - butterflyCol) == 0 && abs(row - butterflyRow) == 1) {
            gameArray[butterflyRow][butterflyCol].butterflyHere = false
            if gameArray[row][col].cageName == "emptyGameCage" {
                gameArray[row][col].alreadyOpened = true
            }
            gameArray[row][col].butterflyHere = true
            butterflyCol = col
            butterflyRow = row
            if gameArray[row][col].haveFlag {
                gameArray[row][col].haveFlag = false
                flagsCount += 1
            }
            if gameArray[row][col].haveBomb {
                gameArray[row][col].netOpacity = 1
                catchButterflyByNet(row: row, col: col)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    makeMistake()
                }
            }
            if gameArray[row][col].flowerHere {
                showAllFlags()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    youWin = true
                }
            }
            if gameArray[row][col].haveArrow {
                standOnArraow(row: row, col: col)
            }
        }
    }
    
    func standOnArraow(row: Int, col: Int) {
        switch gameArray[row][col].cageName {
        case "jumpUp":
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                gameArray[row][col].butterflyOpacity = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                gameArray[row][col].butterflyOpacity = 1
                gameArray[row][col].butterflyHere = false
                gameArray[row-2][col].butterflyHere = true
                if gameArray[row][col-2].cageName == "emptyGameCage" {
                    gameArray[row-2][col].alreadyOpened = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    butterflyCol = col
                    butterflyRow = row-2
                }
            }
        case "jumpDown":
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                gameArray[row][col].butterflyOpacity = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                gameArray[row][col].butterflyOpacity = 1
                gameArray[row][col].butterflyHere = false
                gameArray[row+2][col].butterflyHere = true
                if gameArray[row+2][col].cageName == "emptyGameCage" {
                    gameArray[row+2][col].alreadyOpened = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    butterflyCol = col
                    butterflyRow = row+2
                }
            }
        case "jumpLeft":
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                gameArray[row][col].butterflyOpacity = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                gameArray[row][col].butterflyOpacity = 1
                gameArray[row][col].butterflyHere = false
                gameArray[row][col-2].butterflyHere = true
                if gameArray[row][col-2].cageName == "emptyGameCage" {
                    gameArray[row][col-2].alreadyOpened = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    butterflyCol = col-2
                    butterflyRow = row
                }
            }
        case "jumpRight":
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                gameArray[row][col].butterflyOpacity = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                gameArray[row][col].butterflyOpacity = 1
                gameArray[row][col].butterflyHere = false
                gameArray[row][col+2].butterflyHere = true
                if gameArray[row][col+2].cageName == "emptyGameCage" {
                    gameArray[row][col+2].alreadyOpened = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    butterflyCol = col+2
                    butterflyRow = row
                }
            }
        default:
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                gameArray[row][col].butterflyOpacity = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                gameArray[row][col].butterflyOpacity = 1
                gameArray[row][col].butterflyHere = false
                gameArray[row-2][col].butterflyHere = true
                if gameArray[row-2][col].cageName == "emptyGameCage" {
                    gameArray[row-2][col].alreadyOpened = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    butterflyCol = col
                    butterflyRow = row-2
                }
            }
        }
    }
    
    func showHorizontalBombCount(row: Int, col: Int) -> Int{
        var count = 0
        for i in 0..<gameArray.count {
            for j in 0..<gameArray[i].count {
                if i == row && gameArray[i][j].haveBomb {
                    count += 1
                }
            }
        }
        return count
    }
    
    func showVerticalBombCount(row: Int, col: Int) -> Int{
        var count = 0
        for i in 0..<gameArray.count {
            for j in 0..<gameArray[i].count {
                if j == col && gameArray[i][j].haveBomb {
                    count += 1
                }
            }
        }
        return count
    }
    
    func startFlagShadowTimer() {
        flagFrameShadowRadius = 4
        flagShadowTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation(Animation.easeOut(duration: 1)) {
                flagFrameShadowRadius = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(Animation.easeOut(duration: 1)) {
                    flagFrameShadowRadius = 4
                }
            }
        }
    }
    
    func stopFlagShadowTimer() {
        flagShadowTimer?.invalidate()
        flagShadowTimer = nil
    }
    
}

#Preview {
    Game()
}
