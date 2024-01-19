//
//  tip.swift
//  Tracker
//
//  Created by Sweda Thiyagarajan on 17/07/2021.
//

import Foundation
struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
