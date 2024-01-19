//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sweda Thiyagarajan on 28/09/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}


