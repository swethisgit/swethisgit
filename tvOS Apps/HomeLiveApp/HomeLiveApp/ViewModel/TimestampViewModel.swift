//
//  TimestampViewModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 20/04/2023.
//

import Foundation
import UIKit

class TimestampViewModel : NSObject {
    var timestampView : TimestampView?
    var parentController : ViewController!
    static var x : CGFloat = 0
    
    func loadTimestampView (interval model : TimestampModel, width : CGFloat) {
//        let width : CGFloat = PgmViewDimensions.oneMinuteWidth * width
        
        DispatchQueue.main.async {
            self.timestampView = self.loadTimestampView()
            self.timestampView?.frame = CGRect(x: TimestampViewModel.x , y: 0, width: width, height: 60)
            self.timestampView?.timeLbl?.backgroundColor = .systemPurple
            self.timestampView?.timeLbl?.text = model.time
            
            if let timestampView = self.timestampView {
                TimestampViewModel.x += width + 10
                self.parentController.timstampScrollView.addSubview(timestampView)
//                self.parentController.timstampScrollView.contentSize.width += width + 10
            }
        }
    }
    
    func loadTimestampView() -> TimestampView {
        let nib = UINib(nibName: "TimestampView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! TimestampView
    }
}

