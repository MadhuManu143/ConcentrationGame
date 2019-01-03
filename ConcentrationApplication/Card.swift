//
//  Card.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 12/9/18.
//  Copyright © 2018 Madhu Rimmalapudi. All rights reserved.
//

import Foundation
struct Card : Hashable {
    
    var hashValue : Int {
        return identifier
    }
    static func == (lhs:Card , rhs:Card)->Bool{
        return lhs.identifier == rhs.identifier
    }
    
    
    
    var isFaceUp = false
    var isMatched = false
    private var identifier:Int
    private static var myFactoryIndentifier = 0
    
    
    
    private static func myUniqueIdentifier() -> Int{
        myFactoryIndentifier += 1
        return myFactoryIndentifier
    }
    
    
        init() {
        self.identifier = Card.myUniqueIdentifier()
    }
}
