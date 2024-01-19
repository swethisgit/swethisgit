//
//  ShowDetails.swift
//  TimeIndicatorPOC
//
//  Created by Sweda Thiyagarajan on 20/05/2022.
//

import UIKit

class ShowDetails: UIView {

    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var endingAt: UILabel!
    @IBOutlet weak var startingFrom: UILabel!
    
    var width : CGFloat! = 25
    var x : CGFloat! = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func xibSetup(frame : CGRect)  -> UIView? {
        guard let view = loadViewFromNib(frame: frame) else { return nil}
        view.frame = frame
        view.autoresizingMask =
        [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .orange
        return view
//        addSubview(view)
//        content = view
//        showDetails = content as? ShowDetails
//        showDetails.backgroundColor = .systemOrange
    }
    
    func loadViewFromNib(frame : CGRect) -> UIView? {
        let nibName = "ShowDetails"
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
