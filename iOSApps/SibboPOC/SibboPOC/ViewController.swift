//
//  ViewController.swift
//  VentunoPOC
//
//  Created by Good on 15/10/20.
//  Copyright © 2020 Mobileapps. All rights reserved.
//

import UIKit
import SibboFramework

class ViewController: UIViewController {

    let sibboCMP = SibboCMP.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sibboCMP.showConsentTool(fromController: self, forceOpen: true, completion: { showed in
         if showed {
           print ("CMP Mostrado")
         } else {
           print ("CMP No mostrado")
         }
        })
        
        sibboCMP.showConsentTool(fromController: self, completion: { showed in
         if showed {
           print ("CMP Mostrado")
         } else {
           print ("CMP No mostrado")
         }
        })
        
    //TODO : Update With Confirmation
        ArgAppUpdater.getSingleton().showUpdateWithConfirmation()
        
    //TODO : Update with Force
        // ArgAppUpdater.getSingleton().showUpdateWithForce()
    }
  
    @IBAction func clickButton(_ button : UIButton){
         guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "BottomViewController") as? BottomViewController else { return }
            present(popupVC, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }

//    override var supportedInterfaceOrientations:UIInterfaceOrientationMask {
//        return UIDevice.current.userInterfaceIdiom == .pad ? UIInterfaceOrientationMask.all : UIInterfaceOrientationMask.portrait
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
class PlayData {
    var allWords = [String]()
    

}


