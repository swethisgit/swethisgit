//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    var title: String
    var choice1: String
    var choice2: String
    var choice1Destinstion : Int
    var choice2Destinstion : Int
    
    init (title: String, choice1: String, choice1Destinstion: Int, choice2: String, choice2Destinstion: Int) {
        self.title = title
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice1Destinstion = choice1Destinstion
        self.choice2Destinstion = choice2Destinstion
    }
}


