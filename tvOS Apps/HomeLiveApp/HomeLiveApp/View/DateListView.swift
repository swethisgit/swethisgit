//
//  DateListView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 16/05/2023.
//

import Foundation
import UIKit

class DateListView : UIView {
    @IBOutlet var dateListTable : UITableView?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension DateListView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        return cell
    }
    
    
}
