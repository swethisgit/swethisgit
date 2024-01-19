import UIKit

var greeting = "Hello, playground"

enum HandShape {
    case rock
    case paper
    case scissors
}

enum MatchResult {
    case win
    case draw
    case lose
}

func match(_ a:HandShape, _ b:HandShape)  -> MatchResult{
    var result: MatchResult = .win
    if a == b {
        result = MatchResult.draw
    } else if a == .rock {
        if b == .paper {
            result =  MatchResult.lose
        }
        if b == .scissors {
            result = MatchResult.win
        }
    } else if a == .paper {
        if b == .scissors {
            result =  MatchResult.lose
        }
        if b == .rock {
            result = MatchResult.win
        }
    }else if a == .scissors {
        if b == .rock {
            result =  MatchResult.lose
        }
        if b == .paper {
            result = MatchResult.win
        }
    }
    return result
}

match(HandShape.paper, HandShape.scissors)
match(HandShape.scissors, HandShape.paper)
match(HandShape.rock, HandShape.paper)

func fractionSum (_ a: (Int, Int), _ b:(Int, Int)) -> (Int, Int){
    var sum: (Int, Int)
    
    sum.1 = a.1*b.1
    sum.0 = (a.0*b.1) + (b.0*a.1)
    
    return (sum)
}
let a = (34, 3)
let b = (11, 2)
fractionSum(a, b)

enum CoinType: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

var moneyArray:[(Int,CoinType)] = [(10,.penny),
    (15,.nickle),
    (3,.quarter),
    (20,.penny),
    (3,.dime),
    (7,.quarter)]
var total = 0
for (amount, type) in moneyArray {
    total += amount*type.rawValue
}
print(total)

var strings = ["tuples", "are", "awesome", "tuples", "are", "cool",
    "tuples", "tuples", "tuples", "shades"]
// strings = ["hello", "world", "hello", "swift", "hello", "tuples"]
var countedStrings = [(String, Int)]()
var setString = Set<String>()
var count:Int
for word in strings {
    setString.insert(word)
}
print(setString)
for setWord in setString {
    count = 0
    for setString in strings {
        if setString == setWord {
            count += 1
        }
    }
    countedStrings.append((setWord, count))
}

print(countedStrings)

var numbers = [1, 2, 3, 4, 5]
var sum = numbers.reduce(0, +)
print(sum)

var numbers1 = [4, 7, 1, 9, 6, 5, 6, 9]
let max = numbers1.reduce(2){
    if ($0 > $1 ) {
        return $0
    } else {
        return $1
    }
}
print(max)

strings = ["We", "Heart", "Swift", "is", "learn", "wash", "clean"]
let connected = strings.reduce(""){
    return "\($0) \($1)"
}
print(connected)

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.sort(by: { x, y in
    func divisble 
    
})
