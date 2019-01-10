//
//  ConcentrationThemeChangerViewController.swift
//  ConcentrationApplication
//
//  Created by Madhu Rimmalapudi on 1/9/19.
//  Copyright © 2019 Madhu Rimmalapudi. All rights reserved.
//

import UIKit

class ConcentrationThemeChangerViewController: UIViewController, UISplitViewControllerDelegate {

    let theme = ["Sports":["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🥏","🏸","🏓","🏏"],
                 "Animals":["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷"],
                 "Faces":["🥰","😘","😀","☺️","😳","🥵","😡","😎","🧐","🤓","😛","😚","🥳"]]
    private var splitViewDetailViewController : ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    private var lastNavigationControllerPresent : ConcentrationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theame == nil {
                return true
            }
        }
        return false
    }
    @IBAction func changeTheme(_ sender: UIButton) {
        if let cvc = splitViewDetailViewController {
            if let ThemeName = sender.currentTitle, let theme = theme[ThemeName] {
                cvc.theame = theme
            }
        }else if let cvc = lastNavigationControllerPresent {
            if let ThemeName = sender.currentTitle, let theme = theme[ThemeName] {
                cvc.theame = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else{
            performSegue(withIdentifier: "Theme Changer", sender: sender)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Theme Changer" {
            if let ThemeName = (sender as? UIButton)?.currentTitle, let theme = theme[ThemeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theame = theme
                    lastNavigationControllerPresent = cvc
                }
            }
        }
        
    }

}
