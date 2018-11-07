//
//  Cards.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 06/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import Foundation

struct Card {
    var rank :Rank
    var suite :Suite
    
    //MARK: Making enum CaseIterable allows to loop through enum vals.
    enum Rank: String, CaseIterable {
        case jack = "J"
        case ace = "A"
        case king = "K"
        case queen = "Q"
        case two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7"
        , eight = "8", nine = "9", ten = "10"
        
    }
    
    //MARK: Making enum CaseIterable allows to loop through enum vals.
    enum Suite: String, CaseIterable {
        case diamond = "♦️"
        case spade = "♠️"
        case heart = "♥️"
        case club = "♣️"
    }
    static let ALL_RANKS = 13
    static let ALL_SUITES = 4
}
