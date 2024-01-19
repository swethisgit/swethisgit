//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sweda Thiyagarajan on 11/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totaLabel: UILabel!
    var amount: String = "0.0"
    var givenPerson: String = "0"
    var givenPercent: String = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        totaLabel.text = amount
        settingLabel.text = "Split between \(givenPerson) person, with \(givenPercent) tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
