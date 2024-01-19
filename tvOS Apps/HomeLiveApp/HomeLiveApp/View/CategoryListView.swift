//
//  CategoryView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
import UIKit

class CategoryListView : UIView {
    @IBOutlet var categoryBtn : FocusTvButton?
    @IBOutlet var categoryTitle : UILabel?
    
    var parentController : ViewController?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        categoryBtn?.normalBackgroundColor = .black
        categoryBtn?.focusedBackgroundColor = .systemPurple
        categoryBtn?.focusedBackgroundEndColor = .purple
    }
    
    @IBAction func categoryPressed (sender: UIButton) {
        if let parentController = parentController {
            
            for category in parentController.categoryListModel {
                if category.label.lowercased() == sender.currentTitle?.lowercased()  {
                    parentController.categoryParam = category.categoryId
                    break
                }
            }
            parentController.updateEpgData()
        }
       
    }
    
    
}
