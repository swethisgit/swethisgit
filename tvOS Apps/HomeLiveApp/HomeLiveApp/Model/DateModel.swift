//
//  DateModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 16/05/2023.
//

import Foundation

class DateModel {
    var primaryLabel : String = ""
    var secondaryLabel : String = ""
    var value : String = ""
    var dateParam : String = ""
    var urlStr : String = ""
    var url : URL? {
        let url = URL(string: self.urlStr)
        if let url = url {
            return url
        }
        return nil
    }
}
