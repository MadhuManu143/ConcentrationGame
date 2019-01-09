//
//  ViewController.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 12/8/18.
//  Copyright © 2018 Madhu Rimmalapudi. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private(set) var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
    @IBOutlet private var buttonsCollection: [UIButton]!
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairs )
    
    private var numberOfPairs : Int {
        get {
            return (buttonsCollection.count+1)/2
        }
    }

    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction private func CardButtonClicked(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = buttonsCollection.index(of:sender) {
            game.chooseACard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Card button is not ib the array")
        }
    }
    private func updateViewFromModel() {
        if buttonsCollection != nil {
            for index in buttonsCollection.indices {
                let card = game.cards[index]
                let button = buttonsCollection[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card ), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                }else{
                    button.setTitle(" ", for: .normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                }
            }
        }
        
    }
    var theame : [String]? {
        didSet {
            emojiAry = theame ?? []
            emojiDictionary = [:]
            updateViewFromModel()
        }
    }
    private var emojiAry = ["🐶","👻","🤡","👹","🐶","👻","🤡","👹"]
    private var emojiDictionary = [Card:String]()
    private func emoji(for card : Card)-> String {
        if emojiDictionary[card] == nil, emojiAry.count > 0 {
            emojiDictionary[card] = emojiAry.remove(at: emojiAry.count.arc4random)
        }
        return emojiDictionary[card] ?? "?"
    }
    
}
extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
    
}

