//
//  ProgramViewModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation
import UIKit

class ProgramViewModel : NSObject {
    var pgmView : ProgramView? = nil
    var parentController : ViewController!
    static var x : CGFloat = 0
    static var y : CGFloat = 0
    
    func loadProgramView (x : CGFloat, y : CGFloat, width : CGFloat, pgm model : ProgramModel) {
        let width : CGFloat = width
        
        DispatchQueue.main.async {
            self.pgmView = self.loadProgramView()
            self.pgmView?.frame = CGRect(x: x , y: y, width: width, height: PgmViewDimensions.height)
            self.pgmView?.pgmTitle?.text = model.title
            self.pgmView?.pgmTiming?.text = model.interval
            print ("pgmTiming: \(self.pgmView?.pgmTiming)")
            if let pgmView = self.pgmView {
                
                self.parentController.programScrollView.addSubview(pgmView)
                self.parentController.programScrollView.contentSize.width += width + 50
            }
        }
    }
    
    func loadProgramView() -> ProgramView {
        let nib = UINib(nibName: "ProgramView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! ProgramView
    }
}
