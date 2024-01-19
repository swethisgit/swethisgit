import UIKit
import os





func findFact( a : inout Int) -> Int{
    var fact = 1
    while (a > 0) {
        fact *= a
        a -= 1
    }
    return fact
}

var a = 5

let res = findFact(a: &a)
print(res)


func findFibanocci(till: inout Int)  -> Int{
    var fib = 0
    var nxtFib = 1
    var res = 0
    while (till > 0) {
        print ("fib : \(fib) nxt : \(nxtFib) res: \(res)")
        res = fib + nxtFib
        nxtFib = fib
        fib = res
        till -= 1
    }
    return res
}
var fib = 10
findFibanocci(till: &fib)


func assignMarks(student: String, subs: [String], score: [Int]) -> (String, [(String, Int)]) {
    var studentMarks : [(String, Int)] = []
    for (subsect, mark) in zip(subs, score) {
        studentMarks.append((subsect, mark))
    }
    return (student, studentMarks)
}

var subjects = ["Maths", "English", "Tamil", "Hindi", "Computer" ]
var marks = [100, 98, 98, 90, 98]
let name = "Sweda"
let studentDetail = assignMarks(student: name, subs: subjects, score: marks)
print(studentDetail.0)
print(studentDetail.1)

class Person {
    var residence : Residence?
    func getRoomNo () -> Int? {
        if (residence != nil) {
            return residence?.noofRooms
        } else {
            return nil
        }
    }
}

class Residence {
    var noofRooms = 1
    
}

var john = Person()
print(john.getRoomNo() ?? 0)
john.residence = Residence()
john.residence?.noofRooms
print(john.getRoomNo() ?? 0)
john.residence?.noofRooms = 9
print(john.getRoomNo() ?? 0)
john.residence?.noofRooms

var sweda = Person()
sweda.residence = Residence()
sweda.residence?.noofRooms
sweda.residence?.noofRooms = 5
print(sweda.getRoomNo() ?? 0)
sweda.residence?.noofRooms

var names = ["banu", "swe", "jammu"]
var reversedName = names.sorted(by: {$0 > $1})
print(reversedName)

var arra = [1, 2, 3]
var arrb = arra
arrb.append(4)
print(arrb, arra)

class A {
    static var i = 0
    var x = 0
}

class B {
     func accessA (){
        let o = A()
        A.i += 1
        o.x += 100
        print( "i is \(A.i) in B")
    }
}
class C {
    let o = A()
    func accessA() {
        print("i is \(A.i) x \(o.x)")
    }
}
var a1 = B()
a1.accessA()
var a2 = C()
a2.accessA()
a1.accessA()
a1.accessA()
a1.accessA()
a2.accessA()

let i: Int = 1
let j: UInt = 2
let k: Double = 3.2

let ci = Double(i) + k + Double(j)
let c = Double(i) + Double(j) + k + ci

extension Int {
    var double : Double {
        return Double(self)
    }
    func doubleVal() -> Double {
        return Double(self)
    }
}

let z = i.double + i.doubleVal() + k

var ar = [1, 0, 1, 1, 0]
var cn = 0
for n in ar {
    var an = n
    while (an > 0) {
        cn += 1
        an -= 1
    }
}

func addTwoInts (Adda a: Int, Withb b: Int) -> Int {
    a + b
}

func mulTwoInts (Adda a: Int, Withb b: Int) -> Int {
    a * b
}

var add: (Int, Int) -> Int = mulTwoInts
var mul : (Int, Int) -> Int = addTwoInts(Adda:Withb:)
add(2, 3)
mul(3, 3)
add(3, 3)


