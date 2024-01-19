//
//  ChannelViewModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation
import UIKit

class ChannelViewModel : NSObject {
    var channelView : ChannelView? = nil
    var parentController : ViewController!
    static var y : CGFloat = 0
    
    func loadChannelView (channel model : ChannelModel) {
        let width : CGFloat = 100
        
        DispatchQueue.main.async {
            self.channelView = self.loadChannelView()
            self.channelView?.frame = CGRect(x: 0 , y: ChannelViewModel.y, width: width, height: PgmViewDimensions.height)
            if let thumbnailURL = model.thumbnailURL {
                self.channelView?.channelLogo?.load(url: thumbnailURL)
            }
            
            if let channelView = self.channelView {
                ChannelViewModel.y += PgmViewDimensions.height + 10
                self.parentController.channelScrollView.addSubview(channelView)
                self.parentController.channelScrollView.contentSize.height += PgmViewDimensions.height + 10
            }
        }
    }
    
    func loadChannelView() -> ChannelView {
        let nib = UINib(nibName: "ChannelView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! ChannelView
    }
}
