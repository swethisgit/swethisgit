//
//  SettingsPopOver.swift
//  Player
//
//  Created by Sweda Thiyagarajan on 29/06/2023.
//

import Foundation
import AVKit

class SettingsPopOver: UIView, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tableView : UITableView?
    
    var avPlayer: AVPlayer?
    var parentController : ViewController?
    var settingsButton : SettingsButton?
    let optionsList = ["1080", "720", "480", "360"]
    let optionsDict : [String : String] = ["1080" : "https://u7a8b7b2.stackpathcdn.com/videos/migration/1294836/1920_1080/1920_1080_final.m3u8",
        "720" : "https://u7a8b7b2.stackpathcdn.com/videos/migration/1294836/480_270/480_270_final.m3u8",
        "480" : "https://u7a8b7b2.stackpathcdn.com/videos/migration/1294836/960_540/960_540_final.m3u8",
        "360" : "https://u7a8b7b2.stackpathcdn.com/videos/migration/1294836/1294836.m3u8"]
    
   override func awakeFromNib() {
       super.awakeFromNib()
       tableView?.delegate = self
       tableView?.dataSource = self
       tableView?.register(UINib(nibName: "QualityOption", bundle: nil), forCellReuseIdentifier: "QualityOption")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QualityOption", for: indexPath) as! QualityOption
       
        let quality = optionsList[indexPath.row]
        cell.option?.text = quality
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionChosen = optionsList[indexPath.row]
//        let url = optionsDict[optionChosen]
//        print("url : \(url)")
        settingsButton?.updateSettingsUI()
        parentController?.setBitRate(optionChosen)
    }
    
}

