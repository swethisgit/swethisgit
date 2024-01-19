//
//  PopUpView.swift
//  Popup
//
//  Created by Sweda Thiyagarajan on 10/06/2022.
//

import UIKit

class PopUpView: UIView {

    @IBOutlet weak var stackCategory: UIStackView!
    var categoryList = [String]()
    var showCategory : CategoryView!
    var calledBy : PopupWindow!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryList.append("Entertainment")
        loadStackView()
    }

    func loadStackView() {
        var y : CGFloat  = 0
        let height : CGFloat = 64
        for category in categoryList {
            let nib = UINib(nibName: "CategoryView", bundle: nil)
            showCategory = (nib.instantiate(withOwner: nil, options: nil).first as! CategoryView)
            showCategory.categoryName?.text = category
            stackCategory.addSubview(showCategory)
            y += height
        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        calledBy.closeMe(sender)
    }
}
