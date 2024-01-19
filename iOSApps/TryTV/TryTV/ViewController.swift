//
//  ViewController.swift
//  TryTV
//
//  Created by Sweda Thiyagarajan on 08/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func macSelected(_ sender: UIButton) {
        showAlert(status: "Wrong", title: "Try again")
    }
    
    @IBAction func iOSSelected(_ sender: UIButton) {
        showAlert(status: "Wrong", title: "Try again")
    }
    
    @IBAction func watchOSSelected(_ sender: UIButton) {
        showAlert(status: "Wrong", title: "Try again")
    }
    
    
    @IBAction func tvOsSelected(_ sender: UIButton) {
        showAlert(status: "Correct", title: "Nailed it!!!")
    }
    
    func showAlert(status message: String, title forButton: String) {
        let alertController = UIAlertController(title: message, message: forButton, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alertController.addAction(ok)
        
        self.present(alertController, animated: true) {
        }
    }
}

