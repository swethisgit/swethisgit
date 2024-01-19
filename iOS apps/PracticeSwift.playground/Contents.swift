import UIKit

var greeting = "Hello, playground"
print (greeting)

func findTotalandAvg (scores marks: Int...) -> (Int, Double) {
    var total = 0
    for mark in marks {
        total += mark
    }
    let avg : Double = Double (total/marks.count)
    return (total, avg)
}
var tup: (Int, Double) = findTotalandAvg(scores: 90, 98, 95, 95, 98, 97)
print ("sum and avg is  \(tup.0 ) \(tup.1)")
//print (findTotalandAvg(scores: 90, 98, 95, 95, 98, 97))


