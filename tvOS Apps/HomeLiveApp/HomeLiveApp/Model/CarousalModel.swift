//
//  CarousalModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 15/04/2023.
//

import Foundation

class CarousalModel {
    var overline : String = ""
    var title : String = ""
    var description : String = ""
    var subtitle : String = ""
    var thumbnail : String = ""
    var thumbnailURL : URL? {
        let url = URL(string: self.thumbnail)
        if let url = url {
            return url
        }
        return nil
    }
    
    var overlineIcon : String = ""
    var overlineIconURL : URL? {
        let url = URL(string: self.overlineIcon)
        if let url = url {
            return url
        }
        return nil
    }
    
    var totalDuration : Double = 0
    var elapsedTime : Double = 0
    
    var durationInMinsStr : String = ""
    var durationInMins : Int {
        let minutesIndex = durationInMinsStr.firstIndex(of: ":") ?? durationInMinsStr.startIndex
        var minutes = Int(durationInMinsStr[..<minutesIndex]) ?? 0
        let seconds = Int(durationInMinsStr[minutesIndex...]) ?? 0
        print ("minutes : \(minutes) seconds : \(seconds)")
        if seconds > 0 {
            minutes += 1
        }
        print ("minutes : \(minutes) ")
        return 0
    }
    
    
}
