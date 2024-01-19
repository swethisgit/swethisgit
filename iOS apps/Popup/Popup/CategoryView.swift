//
//  CategoryView.swift
//  Popup
//
//  Created by Sweda Thiyagarajan on 09/06/2022.
//

import UIKit

class CategoryView: UIView {

    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var optionButton: UIButton!
    var selectedState : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func clickedEntertainment(_ sender: UIButton) {
        toggleSelection(isSelected: selectedState, tappedButton: sender)
    }
    
    func toggleSelection(isSelected:Bool, tappedButton:UIButton) {
        if !isSelected {
            selectedState = true
            tappedButton.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        } else {
            selectedState = false
            tappedButton.setImage(UIImage(systemName: "circlebadge"), for: .normal)
        }
    }
    
}
