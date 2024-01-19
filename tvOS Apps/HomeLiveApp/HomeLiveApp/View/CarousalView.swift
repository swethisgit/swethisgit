//
//  CarousalView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 15/04/2023.
//

import Foundation
import UIKit

class CarousalView : UIView {
    @IBOutlet var overlineLbl:UILabel!
    @IBOutlet var descriptionLbl:UILabel!
    @IBOutlet var titleLbl:UILabel!
    @IBOutlet var subtitleLbl:UILabel!
    @IBOutlet var overlineIconImgView:UIImageView!
    @IBOutlet var thumbnailImgView:UIImageView!
    @IBOutlet var progressBar:UIProgressView!
    @IBOutlet var maskBtn:FocusTvButton!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        maskBtn.focusedBackgroundColor = .systemPurple
        maskBtn.focusedBackgroundEndColor = .purple
        maskBtn.cornerRadius = 20
    }
}
