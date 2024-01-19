//
//  DateListViewModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 16/05/2023.
//

import Foundation
import UIKit

class DateListViewModel : NSObject {
    var dateView : DateView? = nil
    var parentController : ViewController!
    static var x : CGFloat = 0
    static var y : CGFloat = 0
    static var dateListView = DateListView()
    
    func loadDateListView(x : CGFloat, dateModel: DateModel) {
        DispatchQueue.main.async {
            self.dateView = self.loadDateView ()
            self.dateView?.frame = CGRect(x: x, y: 0, width: 300, height: 200)
            self.populateDateView(data: dateModel)
            
//            DateListViewModel.dateListView.addSubview(dateView)
            
        }
    }
    
    func loadDateView() -> DateView {
        let nib = UINib(nibName: "DateView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! DateView
    }
    
    func populateDateView(data model: DateModel) {
        dateView?.dateLabel.text = model.secondaryLabel
    }
}
