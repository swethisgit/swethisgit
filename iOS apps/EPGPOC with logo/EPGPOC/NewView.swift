//
//  NewView.swift
//  EPGPOC
//
//  Created by Sweda Thiyagarajan on 31/03/2022.
//

import UIKit

class NewView: UIView {

    @IBOutlet weak var clockView: UIImageView!
    @IBOutlet weak var showTill: UILabel!
    @IBOutlet weak var showFrom: UILabel!
    @IBOutlet weak var showTitle: UILabel!
    
    var baseViewController : UIViewController?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
//        self.frame.size.height = 100
    }
    
    override func awakeFromNib() {
        print("woke up")
    }

    @IBAction func pgmTapped () {
        print("pgm tapped | ")
        let nib = UINib(nibName: "PopupView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! PopupView
        let popupBackground = UIView(frame: CGRect(x: 0, y: 0, width: baseViewController?.view.frame.width ?? 0, height: baseViewController?.view.frame.height ?? 0))
        popupBackground.backgroundColor = .black
        popupBackground.alpha = 0.75
        
        let alertController = UIAlertController(title: "Show detail", message:  "", preferredStyle: .alert)
        alertController.view.backgroundColor =  .black
        alertController.view.alpha = 0.75
        
//        nib.frame.size = CGSize(width: baseViewController?.view.frame.width ?? 0, height: 200)
        nib.backgroundColor = .lightGray
        nib.alpha = 1
        nib.malertController = alertController
        nib.parentView = self
        nib.imageURL = "https://d2w0puppdwdeoi.cloudfront.net/Pyar_Hi_Pyar_FUM_HD_SNP.jpg"
//        nib.bgView = popupBackground
        nib.setup(show: showTitle.text ?? "", time: "\(showFrom.text ?? "")-\(showTill.text ?? "")", image: "")
        alertController.view.frame.size = nib.frame.size
//        baseViewController?.view.addSubview(popupBackground)
        alertController.view.addSubview(nib)
        if let mController = baseViewController {
            mController.present(alertController, animated: true)
        }
    }
}
