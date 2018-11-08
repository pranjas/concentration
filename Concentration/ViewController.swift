//
//  ViewController.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 06/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let game = Concentration(numCards: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private var prevIndex :Int?
    private var checkFlip = false

    @IBAction func onCardClick(_ sender: Any) {
        if prevIndex == nil {
            let cardIndex = 10.random()
            print("Selecting card at index \(cardIndex)")
            let selectedCard = game.getCardAt(index: cardIndex)
            print("selected card rank = \(String(describing: selectedCard?.rank)), suite = \(String(describing: selectedCard?.suite))")
            
            if selectedCard != nil {
                if (checkFlip) {
                    print("Checking flip \(game.flip(card: selectedCard!))")
                }
                else {
                    game.flip(card: selectedCard!)
                }
                checkFlip = !checkFlip
            }
        }
    }
    
}

