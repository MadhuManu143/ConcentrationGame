//
//  Concentration.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 12/9/18.
//  Copyright © 2018 Madhu Rimmalapudi. All rights reserved.
//

import Foundation
struct Concentration {
    private(set) var cards = [Card]()
    private var oneAndOnlyFaceUpCard : Int? {
        get {
//            var foundIndex : Int?
            let faceUpCardIndex = cards.indices.filter {(cards[$0].isFaceUp)}
            return faceUpCardIndex.count == 1 ? faceUpCardIndex.first : nil
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                            foundIndex = index
//                        }else{
//                            return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    

    mutating func chooseACard(at index : Int) {
        if !cards[index].isMatched {
            if let matchIndex = oneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                oneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards : Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    }
    
}
