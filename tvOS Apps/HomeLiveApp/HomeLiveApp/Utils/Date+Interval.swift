//
//  Date+Interval.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 20/04/2023.
//

import Foundation
extension Date {
    var startOfDay: Double {
        return Calendar.current.startOfDay(for: self).timeIntervalSince1970
    }
    
    var endOfDay : Double {
        let secondsPerDay : Double = 86399
        return startOfDay + secondsPerDay
    }
    
    func isEndofToday() -> Bool {
        if Date().timeIntervalSince1970 == endOfDay {
            return true
        } else if endOfDay-10 < Date().timeIntervalSince1970 {
            return true
        }
        return false
    }
    
    func getTodayDate () -> String {
           //let date = Date.now
           let dateFormatter = DateFormatter()
           
           dateFormatter.dateFormat = "dd MMM"
           let formattedDate = dateFormatter.string(from: Date())
           return formattedDate
       }
    
    func isTodaySelected(selectedTab: String) -> Bool {
        if selectedTab == getTodayDate() {
            return true
        }
        return false
    }

    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    var endOfMonth:Date{
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.firstDayOfTheMonth)!
    }
    
    func getIntervals (forToday startingFrom:Double) -> String {
        let date = Date(timeIntervalSince1970: startingFrom)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm a"
        let formattedTime = dateFormatter.string(from: date)
        return formattedTime
    }
    
    func convertDoubletoDate (_ dateInEpoc:Double) -> String {
        
        let date = Date(timeIntervalSince1970: dateInEpoc )
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm a"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func getIntervals(withMinutes: Int) -> [String] {
        var dateAsDouble = Date().startOfDay
//        var date = Date(timeIntervalSinceNow: dateAsDouble)
        var intervals = [String]()
        let intervalPerDay = (24*60)/withMinutes
        for i in 1...intervalPerDay {
            let datefromdouble = Date().convertDoubletoDate(dateAsDouble)
            intervals.append(datefromdouble)
            dateAsDouble += Double(withMinutes * 60)
            print("i ==> \(i) intervals ==> \(datefromdouble)")
        }
        return intervals
    }
}
