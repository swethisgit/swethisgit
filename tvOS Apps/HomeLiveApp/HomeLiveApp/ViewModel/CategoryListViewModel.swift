//
//  CategoryListViewModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
import UIKit

class CategoryListViewModel : NSObject {
    var categoryView : CategoryListView?
    var parentController : ViewController!
    static var x : CGFloat = -7.0

    func loadCategoryView (category model : CategoryListModel) {
        let width : CGFloat = 350
        
        DispatchQueue.main.async {
            self.categoryView = self.loadCategoryView()
            self.categoryView?.parentController = self.parentController
            self.categoryView?.frame = CGRect(x: CategoryListViewModel.x, y: 0, width: width, height: 50)
            self.categoryView?.categoryBtn?.cornerRadius = 15
            self.categoryView?.categoryTitle?.text = model.label
            self.categoryView?.categoryBtn?.setTitle(model.label, for: .normal)
            if let categoryView = self.categoryView {
                CategoryListViewModel.x += width + 30
                self.parentController.categoryScrollView.addSubview(categoryView)
                self.parentController.categoryScrollView.contentSize.width += width + 30
            }
        }
    }
    
    func loadCategoryView() -> CategoryListView {
        let nib = UINib(nibName: "CategoryListView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! CategoryListView
    }
}

extension CategoryListViewModel : UIFocusEnvironment {
    var preferredFocusEnvironments: [UIFocusEnvironment] {
        return[]
    }
    
    var parentFocusEnvironment: UIFocusEnvironment? {
        return self.parentController.categoryScrollView
    }
    
    var focusItemContainer: UIFocusItemContainer? {
        return self.parentController.categoryScrollView
    }
    
    func setNeedsFocusUpdate() {
        
    }
    
    func updateFocusIfNeeded() {
        
    }
    
    func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        true
    }
    
    func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self.categoryView?.categoryBtn {
            context.nextFocusedView?.backgroundColor = .systemPurple
               // This is when the button will be focused
               // You can change the backgroundColor and textColor here
           } else {
               // This is when the focus has left and goes back to default
               // Don't forget to reset the values
           }
    }
    
   
    
   
}
