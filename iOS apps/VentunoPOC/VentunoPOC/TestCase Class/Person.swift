//
//  Person.swift
//  VentunoPOC
//
//  Created by Good on 31/10/20.
//  Copyright © 2020 Mobileapps. All rights reserved.
//

import Foundation

struct Person {

    let first: String
    let last: String

    var fullName: String {
        return "\(first) \(last)"
    }

    var fullNameLastFirst: String {
        return "\(last) \(first)"
    }
    
}
