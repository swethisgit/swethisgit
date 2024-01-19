//
//  EPG.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 22/06/2022.
//

import UIKit
import TVMLKit

class EPG: TVInterfaceFactory {
    static let elementName = "EPG"
    static var sharedInstance : AppDelegate?
    var epgView : EPGView!
    
    override func makeView(element: TVViewElement, existingView: UIView?) -> UIView? {
        print(" \(element.name)")
        if element.name == EPG.elementName {
//            let lbl = existingView as? UILabel ?? UILabel(frame: CGRect(x: 0, y: 850, width: 200, height: 200))
//            lbl.backgroundColor = .yellow
//            lbl.text = "I am seen"
//            return lbl
//            epgView = existingView as? EPGView ?? UIView(frame: CGRect(x: 0, y: 800, width: 1920, height: 200))
            epgView = existingView as? EPGView ?? EPGView(frame: CGRect(x: 0, y: 800, width: 1920, height: 200))
            if let epgDatasource = EPG.sharedInstance?.mEPGDatasource {
                epgDatasource.epgView = epgView
            }

            if let sharedInstance = EPG.sharedInstance {
                sharedInstance.mEpgView = epgView
            }
            return epgView!
        }
        return nil
    }
    
   
}
