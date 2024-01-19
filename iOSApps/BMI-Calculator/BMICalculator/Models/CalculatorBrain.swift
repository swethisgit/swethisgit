//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sweda Thiyagarajan on 07/10/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmis :BMI?
    var advice : String?
    var color : UIColor?
    mutating func calculateBMI (height: Float, weight: Float) {
        let bmi = weight/pow(height, 2)
        if bmi < 18.5 {
            advice = "Underwieght"
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else if bmi >= 18.5 && bmi <= 24.9 {
            advice = "Normal"
            color = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            advice = "Over weight"
            color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        bmis = BMI(BMI: bmi, advice: advice ?? "No more advice", color: color ?? .white)
    }
    
    func getBMIValue() -> String{
        return String(format: "%.1f", self.bmis?.BMI ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmis?.advice ?? "No more advice"
    }
    
    func getColor() -> UIColor {
        return bmis?.color ?? #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
}
