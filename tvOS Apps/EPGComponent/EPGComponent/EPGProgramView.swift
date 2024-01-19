//
//  EPGProgramView.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 20/06/2022.
//

import UIKit

class EPGProgramView: UIView {

    @IBOutlet weak var pgmBtnMask: FocusTvButton!
    @IBOutlet weak var pgmNameLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var clockImage: UIImageView!
    static func instanceFromNib() -> EPGProgramView {
        let view = UINib(nibName: "EPGProgramView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! UIView
        return view as! EPGProgramView
    }
    
}
