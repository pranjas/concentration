//
//  ConcentrationTheme.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 08/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import Foundation
import UIKit

class ConcentrationTheme {
    
    static let sportsTheme = ["🏑","🏏","🏈","🏓","⚾️"
                             ,"🏅","🏀","🥊","⛳️","🤺"]
    
    static let halloweenTheme = ["👻","🎃","👹","👺","💀"
                                ,"☠️","👽","👾","🤖","💩"]
    
    static let facesTheme = ["😛","😝","😜","🤪","🤓"
                            ,"😎","🤬","🤯","🤮","🤧"]
    
    static let animalTheme = ["🦓","🦒","🦕","🦔","🦖","🦗",
                              "🕷","🐄","🐅","🐌","🐝"]
    
    static let festivalTheme = ["🎁","🎉","🎊","🎎","👰🏻","📲"]
    static let countryTheme = ["🇮🇳","🇨🇱","🇻🇦","🇨🇳","🇨🇴","🇯🇪",
                               "🇨🇷","🇻🇬","🇯🇵","🇬🇧","🇬🇪"]
    
    static let themeColor = [UIColor.white, .black, .blue, .green, .yellow, .brown, .purple, .orange, .magenta]
    
    static let THEME_COUNT = 6
    static func randomTheme() -> [String] {
        switch THEME_COUNT.random() {
        case 0:
            return sportsTheme
        case 1:
            return halloweenTheme
        case 2:
            return facesTheme
        case 3:
            return animalTheme
        case 4:
            return festivalTheme
        case 5:
            return countryTheme
        default:
            return countryTheme
        }
    }
}
