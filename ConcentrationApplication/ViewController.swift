//
//  ViewController.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 12/8/18.
//  Copyright © 2018 Madhu Rimmalapudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    @IBOutlet var buttonsCollection: [UIButton]!
    lazy var game = Concentration(numberOfPairsOfCards: (buttonsCollection.count+1)/2)

    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func CardButtonClicked(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = buttonsCollection.index(of:sender) {
            game.chooseACard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Card button is not ib the array")
        }
    }
    func updateViewFromModel() {
        for index in buttonsCollection.indices {
            let card = game.cards[index]
            let button = buttonsCollection[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card ), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle(" ", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    var emojiAry = ["🐶","👻","🤡","👹","🐶","👻","🤡","👹"]
    var emojiDictionary = [Int:String]()
    func emoji(for card : Card)-> String {
        if emojiDictionary[card.identifier] == nil, emojiAry.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiAry.count)))
            emojiDictionary[card.identifier] = emojiAry.remove(at: randomIndex)
        }
        
        return emojiDictionary[card.identifier] ?? "?"
    }
    
}

