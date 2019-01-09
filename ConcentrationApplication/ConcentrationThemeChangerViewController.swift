//
//  ConcentrationThemeChangerViewController.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 1/9/19.
//  Copyright © 2019 Madhu Rimmalapudi. All rights reserved.
//

import UIKit

class ConcentrationThemeChangerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    let theme = ["Sports":["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🥏","🏸","🏓","🏏"],
                 "Animals":["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷"],
                 "Faces":["🥰","😘","😀","☺️","😳","🥵","😡","😎","🧐","🤓","😛","😚","🥳"]]
    

    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Theme Changer" {
            if let ThemeName = (sender as? UIButton)?.currentTitle, let theme = theme[ThemeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theame = theme
                }
            }
        }
        
    }

}
