//
//  CarousalViewModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 15/04/2023.
//

import Foundation
import UIKit

class CarousalViewModel : NSObject {
    var carousalView:CarousalView? = nil
    var parentController : ViewController!
    var progressDataCollection =   [String : UIProgressView]()
    var carousalModelCollection = [CarousalModel]()
    var isTimerSet : Bool = false
    var timer : Timer?
    static var x : CGFloat = -70

    func loadCarousalView (carousalModel : CarousalModel) {
        let width : CGFloat = CarousalDimensions.width
        DispatchQueue.main.async {
            self.carousalView = self.loadCarousalView()
            self.carousalView?.frame = CGRect(x: CarousalViewModel.x, y: 0, width: width, height: 400)
            print ("Carousal view : \(self.carousalView)")
            self.populateCarousalView(withCarousal : carousalModel)
            CarousalViewModel.x += width + 10
//            if CarousalViewModel.x > self.parentController.view.frame.size.width {
//                self.parentController.carousalScrollView.contentSize.width += width
//            } else if (CarousalViewModel.x + width + 10) > self.parentController.view.frame.size.width {
//                let missingWidth = (CarousalViewModel.x + width + 10) - self.parentController.view.frame.size.width
//                self.parentController.carousalScrollView.contentSize.width += missingWidth
//            }
        }
    }
    
    func loadCarousalView() -> CarousalView {
        let nib = UINib(nibName: "CarousalView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! CarousalView
    }
    
    func populateCarousalView(withCarousal dataModel : CarousalModel) {
        carousalView?.titleLbl.textColor = UIColor.systemPurple
        carousalView?.overlineLbl.text = dataModel.overline
        carousalView?.descriptionLbl.text = dataModel.description
        carousalView?.titleLbl.text = dataModel.title
        carousalView?.subtitleLbl.text = dataModel.subtitle
        
        let progressPercent = Float(dataModel.elapsedTime/dataModel.totalDuration)
        carousalView?.progressBar.progress = progressPercent
        
        if let carousalView = carousalView {
            progressDataCollection.updateValue(carousalView.progressBar, forKey: dataModel.title)
        }
        
        if let url = dataModel.thumbnailURL {
            carousalView?.thumbnailImgView.load(url: url)
        }
        
        if let url = dataModel.overlineIconURL {
            carousalView?.overlineIconImgView.load(url: url)
        }
        
        if let carousalView = carousalView {
            parentController?.carousalScrollView?.addSubview(carousalView)
        }
        
        if !isTimerSet {
            timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(increaseProgressValue), userInfo: nil, repeats: true)
            isTimerSet = true
        }
        carousalModelCollection.append(dataModel)
    }
    
    @objc func increaseProgressValue() {
    progressBarLoop: for progressData in progressDataCollection {
        carousalLoop: for carousalModel in carousalModelCollection {
                if progressData.key == carousalModel.title {
                    let currentTime = carousalModel.elapsedTime + 30
                    carousalModel.elapsedTime = currentTime
                    
                    let progressPercent = Float(currentTime/carousalModel.totalDuration)
                    progressData.value.progress = progressPercent
                    print ("Progress value: \(progressData.value.progress)")
                    if progressPercent >= 1 {
                        CarousalViewModel.x = -70
//                        parentController.sendCarousalRefreshRequest()
                        timer?.invalidate()
                        isTimerSet = false
                        break progressBarLoop
                    }
                    break
                }
            }
        }
    }
}
