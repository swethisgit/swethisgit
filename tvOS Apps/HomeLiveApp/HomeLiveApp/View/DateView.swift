//
//  DateView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 16/05/2023.
//

import Foundation
import UIKit

class DateView : UITableViewCell {
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var dateBtn : FocusTvButton!
    
    var parentController : ViewController?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

extension DateView {
    @IBAction func dateSelected (sender: FocusTvButton) {
        print("Date selected")
    }
}
