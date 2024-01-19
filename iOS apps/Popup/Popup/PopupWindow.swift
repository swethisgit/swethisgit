//
//  PopupWindow.swift
//  Popup
//
//  Created by Sweda Thiyagarajan on 09/06/2022.
//

import UIKit

class PopupWindow: UIViewController {
    
    @IBOutlet weak var presentCategory: UIStackView!
    var popup : PopUpView!
    var categoryList = [String]()
    var calledBy : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryList.append("Entertainment")
        loadStackView()
    }
    
    func loadStackView() {
        let nib = UINib(nibName: "PopUpView", bundle: nil)
        popup = (nib.instantiate(withOwner: nil, options: nil).first as! PopUpView)
        popup.categoryList = categoryList
        popup.calledBy = self
        presentCategory.addSubview(popup)
        
    }
    
    @IBAction func closeMe(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
}
