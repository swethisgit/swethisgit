//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Sweda Thiyagarajan on 06/10/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String = "0.0"
    var advice: String = "No advice"
    var color : UIColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var adviceLAbel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        BMILabel.text = bmiValue
        adviceLAbel.text = advice
        self.view.backgroundColor = color
        // Do any additional setup after loading the view.
    }
    


    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
