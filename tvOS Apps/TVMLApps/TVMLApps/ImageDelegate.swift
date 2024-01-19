//
//  ImageDelegate.swift
//  TVMLApps
//
//  Created by Sweda Thiyagarajan on 12/05/2022.
//

import TVMLKit

var delegate : AppDelegate!
var tvController : TVApplicationController!
var context : JSContext!
var imgToLoad : String! = ""
var gradedImgView : UIImageView!
var image : UIImage!
var overlayView : UIView!
var kvoToken: NSKeyValueObservation?

class ImageDelegate : NSObject {
    public func imageGradientController (_ appController : TVApplicationController, evaluateAppInJSContext jsContext : JSContext, _ appDelegate : AppDelegate) {
        
        delegate = appDelegate
        tvController = appController
        context = jsContext
            
        let getImageName : @convention(block) (String?) -> Void = {
            (imgName : String?) -> Void in
            print("[log]: \(imgName ?? "no value given")\n")
            imgToLoad = imgName!
            DispatchQueue.main.async {
                self.loadGradientController()
            }
        }
        jsContext.setObject(unsafeBitCast(getImageName, to: AnyObject.self), forKeyedSubscript: "getImageName" as (NSCopying & NSObjectProtocol))
        
    }
    
    func loadGradientController() {
        DispatchQueue.main.async {
            if let imgController = UIStoryboard(name: "GradeImageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GradeImageViewController") as? GradeImageViewController {
                imgController.imaPath = "\(AppDelegate.tvBaseURL)images/\(imgToLoad!)"
                
                if let navController = delegate.appController?.navigationController {
                    navController.pushViewController(imgController, animated: true)
                }
            }

        }
    }
}
