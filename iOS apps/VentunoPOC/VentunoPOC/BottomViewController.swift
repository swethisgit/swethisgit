//
//  BottomViewController.swift
//  VentunoPOC
//
//  Created by Good on 15/10/20.
//  Copyright © 2020 Mobileapps. All rights reserved.
//

import UIKit

class BottomViewController: BottomPopupViewController {

    @IBOutlet weak var viewToAnimateOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.popupDelegate = self
        // Do any additional setup after loading the view.
    }
    
    override var popupHeight: CGFloat { return CGFloat(200) }

    @IBAction func confirmAction(_ button : UIButton) {
        self.showAlertController("Alert", message: "Confirm")
    }
    
    func showAlertController(_ title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let oK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alert.addAction(oK)
           self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func languageSelectAction(_ button : UIButton) {
        self.showAlertController("Alert", message: "\(button.titleLabel?.text ?? "") selected")
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

extension BottomViewController: BottomPopupDelegate {
    
    func bottomPopupViewLoaded() {
        print("bottomPopupViewLoaded")
    }
    
    func bottomPopupWillAppear() {
        print("bottomPopupWillAppear")
    }
    
    func bottomPopupDidAppear() {
        print("bottomPopupDidAppear")
    }
    
    func bottomPopupWillDismiss() {
        print("bottomPopupWillDismiss")
    }
    
    func bottomPopupDidDismiss() {
        print("bottomPopupDidDismiss")
    }
    
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
    }
}


