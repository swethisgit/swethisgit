//
//  ProgramModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation

class ProgramModel {
    
    var title : String = ""
    var description : String = ""
    var interval : String = ""
    
    var startValueStr : String = ""
    var startValue : Double {
        return Double (startValueStr) ?? 0
    }
    
    var endValueStr : String = ""
    var endValue : Double {
        return Double (endValueStr) ?? 0
    }
}
