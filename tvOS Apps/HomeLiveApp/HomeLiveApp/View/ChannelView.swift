//
//  ChannelView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation
import UIKit

class ChannelView : UIView {
    @IBOutlet var channelLogo : UIImageView?
    @IBOutlet var logoBtnMask : FocusTvButton?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        logoBtnMask?.normalBackgroundColor = .clear
        logoBtnMask?.focusedBackgroundColor = .systemPurple
        logoBtnMask?.focusedBackgroundEndColor = .purple
        logoBtnMask?.contentScaleFactor = 1.2
        logoBtnMask?.cornerRadius = 20
    }
}
