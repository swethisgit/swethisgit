//
//  ViewController.swift
//  Popup
//
//  Created by Sweda Thiyagarajan on 09/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: UIButton) {
        let popup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupWindow") as! PopupWindow
        popup.calledBy = self
        self.modalPresentationStyle = .popover
        self.present(popup, animated: true)
       
    }
    
}

