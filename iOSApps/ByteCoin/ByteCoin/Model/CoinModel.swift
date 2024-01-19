//
//  File.swift
//  ByteCoin
//
//  Created by Sweda Thiyagarajan on 14/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
struct CoinModel {
    let rate: Double
    let currency: String
    
    var displayRate: Double {
        rate.round(thisno:rate, to: 3)
    }
}

extension Double {
    func round(thisno num:Double, to givenNo: Int) -> Double  {
        let multiplier = pow(10, Double(givenNo))
        var newNum = num * multiplier
        newNum.round()
        newNum = newNum / multiplier
        return newNum
    }
    
}
