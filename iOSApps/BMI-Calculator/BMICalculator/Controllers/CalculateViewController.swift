//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    var BMI: Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChanged(_ sender: UISlider, forEvent event: UIEvent) {
        
        let height = Float(String(format:"%.2f", sender.value))!
        heightLabel.text = String(height) + "m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = String(weight)+"Kg"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        BMI = Float(weight)/pow(height,2)
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = calculatorBrain.getBMIValue()
            destination.advice = calculatorBrain.getAdvice()
            destination.color = calculatorBrain.getColor()
        }
    }
}

