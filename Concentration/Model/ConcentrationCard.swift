//
//  ConcentrationCard.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 08/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import Foundation

struct ConcentrationCard {
    var label :String
    func equals (card:ConcentrationCard)->Bool{
        return card.label == self.label
    }
}
