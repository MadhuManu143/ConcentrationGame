//
//  Card.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 12/9/18.
//  Copyright © 2018 Madhu Rimmalapudi. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    static var myFactoryIndentifier = 0
    static func myUniqueIdentifier()->Int{
        myFactoryIndentifier += 1
        return myFactoryIndentifier
    }
    init() {
        self.identifier = Card.myUniqueIdentifier()
    }
}
