//
//  ViewController.swift
//  DatePickerPOC
//
//  Created by Sweda Thiyagarajan on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDatePicker()
        // Do any additional setup after loading the view.
    }

    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date.distantPast
        datePicker.maximumDate = Date.now
        datePicker.preferredDatePickerStyle = .wheels
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateField.inputAccessoryView = toolbar
        dateField.inputView = datePicker
        
        monthField.inputAccessoryView = toolbar
        monthField.inputView = datePicker
        
        yearField.inputAccessoryView = toolbar
        yearField.inputView = datePicker
    }

    @objc func donedatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        dateField.text = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "MMM"
        monthField.text = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "yyyy"
        yearField.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }

    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
}

