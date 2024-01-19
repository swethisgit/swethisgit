import UIKit
import Darwin

func greeting() {
    for _ in 1...4 {
        print("Hello")
    }
}
var age = 234
greeting()

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    if loveScore > 80 {
        print("You will love each other like Kanye loves Kanye")
    } else if loveScore >= 40 && loveScore <= 80 {
        print("You go together like coke and mentos")
    } else {
        print("Ÿou will be forever alone")
    }
}
loveCalculator()

func isLeap(year: Int) {
  
  //Write your code inside this function.
    if (year % 4 == 0) {
        let thisYear = String(year)
        let arrYear = Array(thisYear)
        if (arrYear[2] == "0" && arrYear[3] == "0" ) {
            if (year % 400 == 0) {
                print ("YES")
            } else {
                print("NO")
            }
        } else {
          print("YES")
        }
        
    } else {
        print("NO")
    }
}
isLeap(year: 1984)

func dayOfTheWeek(day: Int) {
  
  //Write your code inside this function.
  
  switch(day){
      case 1:
        print("Monday")
    case 2:
        print("Tuesday")
    case 3:
        print("Wednesday")
    case 4:
        print("Thursday")
    case 5:
        print("Friday")
    case 6:
        print("Saturday")
    case 7:
        print("Sunday")
    default:
        print("Error")
  }
}
    dayOfTheWeek(day: 1)
var studentsAndScores = ["Amy": 88, "James": 55, "Helen":99]

func highestScore(scores: [String: Int]) {
  
  //Write your code here.
  var highestScore = 0
  for score in scores {
      if highestScore < score.1{
          highestScore = score.1
      }
  }
  print(highestScore)
  
}
highestScore(scores: studentsAndScores)

func exercise() {

    // Define the User struct here
    struct User {
        let name : String
        var email : String?
        var followers : Int
        var isActive : Bool
        
        init (name: String, email: String, followers: Int, isActive: Bool) {
            self.name = name
            self.email = email
            self.followers = followers
            self.isActive = isActive
        }
        
        func logStatus () {
            if self.isActive {
                print ("\(self.name) is working hard")
            } else {
                print ("\(self.name) has left earth")
            }
        }
    }

    // Initialise a User struct here




    // Diagnostic code - do not change this code
    print("\nDiagnostic code (i.e., Challenge Hint):")
    var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
    musk.logStatus()
    print("Contacting \(musk.name) on \(musk.email!) ...")
    print("\(musk.name) has \(musk.followers) followers")
    // sometime later
    musk.isActive = false
    musk.logStatus()
    
}


let array = [3, 5, 1, 6, 7, 9]
print(array.map({$0+1}))
print(array.map{"\($0)"})

func fibonacci(n: Int) {
    
    //Write your code here.
    var a = 0, b = 1
    var fib = [Int]()
    fib.append(a)
    fib.append(b)
    for _ in 3...n {
        let c = a + b
        fib.append(c)
        print(fib)
        a = b
        b = c
    }
}
fibonacci(n: 10)
