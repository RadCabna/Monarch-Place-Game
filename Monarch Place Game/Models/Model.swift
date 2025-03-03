//
//  Model.swift
//  Monarch Place Game
//
//  Created by Алкександр Степанов on 01.03.2025.
//

import Foundation

struct GameCage {
    var cageName: String
    var isItTapped = false
    var haveFlag = false
    var butterflyHere = false
    var butterflyOpacity: CGFloat = 1
    var flowerHere = false
    var alreadyOpened = false
    var haveBomb = false
    var haveArrow = false
    var netOpacity: CGFloat = 0
    var netRotationDegreze: CGFloat = 0
}

struct ShopItem {
    var itemImage: String
    var itemCost: Int
}

class Arrays {
    
    static var butterflyShopArray: [ShopItem] = [
    ShopItem(itemImage: "butterflyOne", itemCost: 1),
    ShopItem(itemImage: "butterflyTwo", itemCost: 20),
    ShopItem(itemImage: "butterflyThree", itemCost: 50),
    ShopItem(itemImage: "butterflyFour", itemCost: 100)
    ]
    
    static var flagShopArray: [ShopItem] = [
    ShopItem(itemImage: "flagOne", itemCost: 1),
    ShopItem(itemImage: "flagTwo", itemCost: 20),
    ShopItem(itemImage: "flagThree", itemCost: 50),
    ShopItem(itemImage: "flagFour", itemCost: 100)
    ]
    
    static var gameArray1: [[GameCage]] = [
    [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true),GameCage(cageName: "emptyGameCage", haveBomb: true),GameCage(cageName: "emptyGameCage", flowerHere: true)],
    [GameCage(cageName: "emptyGameCage"),GameCage(cageName: "emptyGameCage"),GameCage(cageName: "emptyGameCage")]
    ]
    
    static var gameArray2: [[GameCage]] = [
    [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true),GameCage(cageName: "emptyGameCage")],
    [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
    [GameCage(cageName: "emptyGameCage", flowerHere: true),GameCage(cageName: "emptyGameCage")]
    ]
    
    static var gameArray3: [[GameCage]] = [
    [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true),GameCage(cageName: "emptyGameCage"),GameCage(cageName: "emptyGameCage")],
    [GameCage(cageName: "emptyGameCage", haveBomb: true),GameCage(cageName: "emptyGameCage", haveBomb: true),GameCage(cageName: "emptyGameCage")],
    [GameCage(cageName: "emptyGameCage", haveBomb: true),GameCage(cageName: "emptyGameCage", haveBomb: true),GameCage(cageName: "emptyGameCage", flowerHere: true)],
    ]
    
    static var gameArray4:[[GameCage]] = [
    [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
    [GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage")],
    [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", flowerHere: true), GameCage(cageName: "emptyGameCage", haveBomb: true)]
    ]
    
    static var gameArray5:[[GameCage]] = [
        [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", flowerHere: true)],
        [GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage")]
        ]
    
    static var gameArray6:[[GameCage]] = [
        [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage", flowerHere: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpLeft", haveArrow: true)]
        ]
    
    static var gameArray7:[[GameCage]] = [
        [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage"), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpDown", haveArrow: true)],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true)],
        [GameCage(cageName: "emptyGameCage", flowerHere: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpLeft", haveArrow: true)]
        ]
    
    static var gameArray8:[[GameCage]] = [
        [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpLeft", haveArrow: true)],
        [GameCage(cageName: "emptyGameCage", flowerHere: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpLeft", haveArrow: true)]
        ]
    
    static var gameArray9:[[GameCage]] = [
        [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpLeft", haveArrow: true)],
        [GameCage(cageName: "emptyGameCage", flowerHere: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpLeft", haveBomb: true)]
        ]
    
    static var gameArray10:[[GameCage]] = [
        [GameCage(cageName: "emptyGameCage", isItTapped: true, butterflyHere: true, alreadyOpened: true), GameCage(cageName: "jumpDown", haveArrow: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true)],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "jumpDown", haveArrow: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "jumpLeft", haveArrow: true)],
        [GameCage(cageName: "emptyGameCage", haveBomb: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "jumpRight", haveArrow: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "emptyGameCage")],
        [GameCage(cageName: "emptyGameCage", flowerHere: true), GameCage(cageName: "emptyGameCage"), GameCage(cageName: "jumpLeft", haveArrow: true),  GameCage(cageName: "emptyGameCage", haveBomb: true) ,GameCage(cageName: "emptyGameCage", haveBomb: true)]
        ]
}
