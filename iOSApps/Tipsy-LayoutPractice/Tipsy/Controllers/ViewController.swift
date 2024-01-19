//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var split = 1
    var splitVal = 1.0
    var tip = 0.0
    var amount : Double = 0.0
    
    override func viewDidLoad() {
        splitNumberLabel.text = "\(split)"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
        }
    }
    
    @IBAction func stepChanged(_ sender: UIStepper) {
        print(split, sender.value, stepper.value)
        billTextField.endEditing(true)
        if sender.value > splitVal {
            split += Int(sender.stepValue)
        } else {
            split -= Int(sender.stepValue)
        }
        splitNumberLabel.text = String(split)
        splitVal = sender.value
    }
    
    @IBAction func calculated(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        var billAmount : Double = Double(billTextField.text ?? "0") ?? 0.0
        billAmount += (billAmount * tip)
        amount = (billAmount)/Double(split)
        print(String(format:"%0.2f", amount))
        performSegue(withIdentifier: "showAmount", sender: self)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAmount" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.amount = String(format:"%0.2f", amount)
            resultVC.givenPerson = String(split)
            resultVC.givenPercent = String(format: "%0.0f",tip*100)+"%"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "," {
            textField.text! +=  "."
            return false
        }
        return true
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        billTextField.endEditing(true)
    }
}

