//
//  PopupView.swift
//  StackInScrollPOC
//
//  Created by Sweda Thiyagarajan on 22/12/2022.
//

import Foundation
import UIKit

class PopupView : UIView {
    
    @IBOutlet var showImage : UIImageView?
    @IBOutlet var showTiming : UILabel?
    @IBOutlet var showName : UILabel?
    
    var imageURL : String?
    var malertController : UIViewController?
    var parentView : NewView?
    var bgView : UIView?
    
    override func awakeFromNib() {
        
        
    }
    
    @IBAction func cancelPopup(sender : UIButton) {
        bgView?.removeFromSuperview()
        malertController?.dismiss(animated: true)
    }
}

extension PopupView {
    func setup(show name:String, time interval:String, image url:String) {
        showName?.text = name
        showTiming?.text = interval
        
        if let _ = parentView ,let imgurl = imageURL, let  url = URL(string: imgurl) {
            let data = try? Data(contentsOf: url)
            if let data = data {
                showImage?.image = UIImage(data: data)
            }
        }
    }
}
