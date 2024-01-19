//
//  VideoPlayerViewController.swift
//  VentunoTask
//
//  Created by Sweda Thiyagarajan on 09/03/2022.
//

import UIKit
import AVKit

class VideoPlayerViewController: AVPlayerViewController, AVPlayerItemMetadataCollectorPushDelegate {
   
    
    var playerItem: AVPlayerItem!
    var metadataCollector: AVPlayerItemMetadataCollector!
    var url:URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        metadataCollector = AVPlayerItemMetadataCollector()
        metadataCollector.setDelegate(self, queue: DispatchQueue.main)
        playerItem = AVPlayerItem(url: url!)
        playerItem.add(metadataCollector)
        self.player?.replaceCurrentItem(with: playerItem)
        self.player?.play()
        // Do any additional setup after loading the view.
    }
}

extension VideoPlayerViewController {
   
    func metadataCollector(_ metadataCollector: AVPlayerItemMetadataCollector, didCollect metadataGroups: [AVDateRangeMetadataGroup], indexesOfNewGroups: IndexSet, indexesOfModifiedGroups: IndexSet) {
        let classLbl:String = metadataGroups[0].classifyingLabel ?? ""
        let uinueId:String = metadataGroups[0].uniqueID ?? ""
        let stDate:Date = metadataGroups[0].startDate
        let endDate:Date? = metadataGroups[0].endDate
        print("class : \(classLbl) |  id: \(uinueId) | st date: \(stDate) | end date: \(endDate) ")
        for metaData in metadataGroups {
            if #available(iOS 16.0, *) {
                print("Hash: \(metaData.items[0].duration.hashValue) epoch: \(metaData.items[0].duration.epoch) timescale: \(metaData.items[0].duration.timescale) ")
            } else {
                // Fallback on earlier versions
            }
            for item in metaData.items {
                let key:String = item.key as! String
                let value:String = item.value as! String
                print( "\(key) : \(value) ")
            }
        }
    
    }
}
