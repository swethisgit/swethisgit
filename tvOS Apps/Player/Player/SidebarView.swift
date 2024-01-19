//
//  SidebarView.swift
//  Player
//
//  Created by Sweda Thiyagarajan on 12/07/2023.
//

import Foundation
import UIKit

class SidebarView : UIView, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView : UITableView?
    
    var optionsList = [1080, 720, 144, 120]
    var viewController : ViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setupSidebarView()
    }
    
    func setupSidebarView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "QualityOption", bundle: nil), forCellReuseIdentifier: "QualityOption")
        tableView?.reloadData()
    }
}

extension SidebarView  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QualityOption", for: indexPath) as! QualityOption
        cell.frame.size.width = 395
        let quality = optionsList[indexPath.row]
        cell.option?.text = "\(quality)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.toggleOptions()
    }
}
