//
//  ProgramView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation
import UIKit

class ProgramView : UIView {
    @IBOutlet var pgmTitle : UILabel?
    @IBOutlet var pgmTiming : UILabel?
    @IBOutlet var pgmBtnMask : FocusTvButton?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        pgmBtnMask?.normalBackgroundColor = .darkGray
        pgmBtnMask?.focusedBackgroundColor = .systemPurple
        pgmBtnMask?.focusedBackgroundEndColor = .purple
        pgmBtnMask?.cornerRadius = 5
    }
}
