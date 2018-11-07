//
//  Concentration.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 06/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import Foundation

class Concentration {
    
    private var cards = [Card]()
    
    private(set) var prevFaceUpCard, curFaceUpCard :Card?
    
    init(numCards: Int) {
        for _ in 0..<numCards {
            cards.append(Card(rank: Card.ALL_RANKS.randomRank(), suite: Card.ALL_SUITES.randomSuite()))
        }
    }
    
    public func flip() {
        if prevFaceUpCard is nil {
            prevFaceUpCard = cards[cards.count.ra]
        }
    }
}

extension Int {
    func random() -> Int {
        if self != 0 {
            return Int(arc4random()) % (self + 1)
        } else {
            return 0
        }
    }
    
    //MARK: Get a randomRank for our card.
    func randomRank()->Card.Rank {
        var rank = 0
        var randomRank = Card.Rank.ace
        
        if self > 0 {
            rank = Int(arc4random()) % (self + 1)
        }
        for __rank in Card.Rank.allCases {
            while(rank > 0) {
                rank -= 1
                continue
            }
            randomRank = __rank
            break
        }
        return randomRank
    }
    
    //MARK: Get a random Suite for our card.
    func randomSuite()->Card.Suite {
        var suite = 0
        var randomSuite = Card.Suite.diamond
        if self > 0 {
            suite = Int(arc4random()) % (self + 1)
        }
        for __suite in Card.Suite.allCases {
            while (suite > 0) {
                suite -= 1
                continue
            }
            randomSuite = __suite
            break
        }
        return randomSuite
    }
}
