//
//  Dragon.swift
//  ClassesDemo
//
//  Created by Sweda Thiyagarajan on 05/10/2021.
//
class Dragon : Enemy {
    var wings = 3
    
    override func move() {
        print("Fly high")
    }
    
    override func attack() {
        super.attack()
        print(" Spit fire and roar")
    }
}
