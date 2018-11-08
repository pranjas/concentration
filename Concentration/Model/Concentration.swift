//
//  Concentration.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 06/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import Foundation

class Concentration {
    
    private var cards = [ConcentrationCard]()
    
    private(set) var faceUpCard:ConcentrationCard?
    
    init(numCards: Int) {
        for _ in 0..<numCards {
            
        }
    }
    
    func getCardAt(index :Int) -> ConcentrationCard? {
        if index >= cards.count {
            return nil
        }
        return cards[index]
    }
    
    //    MARK: about the flip function
//    There's one an only faceup card, when flip is called
//    next time, then we just check what was the card earlier
//    and if matches it or not. So the way this works would be
//    flip would need to be called in a pair.
    
    public func flip(card : ConcentrationCard)->Bool {
        if faceUpCard == nil {
            faceUpCard = card
        } else {
            let result = faceUpCard!.equals(card: card)
            faceUpCard = nil
            return result
        }
        return false
    }
}

extension Int {
    func random() -> Int {
        if self != 0 {
            return Int(arc4random()) % (self)
        } else {
            return 0
        }
    }
}
