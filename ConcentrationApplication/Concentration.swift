//
//  Concentration.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 12/9/18.
//  Copyright © 2018 Madhu Rimmalapudi. All rights reserved.
//

import Foundation
class Concentration {
    var cards = [Card]()
    
    init(numberOfPairsOfCards : Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards = [card,card]
        }
    }
    func chooseACard(at index : Int) {
        
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
}
