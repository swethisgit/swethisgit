//
//  EPGDatasource.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 23/06/2022.
//

import TVMLKit

class EPGDatasource : NSObject {
    var appController : TVApplicationController!
    static var sharedInstance : AppDelegate?
    
    var datesAvailable : [String]?
    var epgAvailable : EpgCardV2.EpgAvailable?
    var mEpgController : ViewController?
    
    public func showDataSource (_ appController: TVApplicationController,
                                evaluateAppJavaScriptIn jsContext: JSContext,_ delegate: AppDelegate) {
        self.appController = appController
        
        let getAvailableShows : @convention(block) (String?) -> Void = { (epgAvialble : String?) -> Void in
            do {
                let epgv2Data = "{\"EpgCardV2\": {\"CanShowEPG\": true}}".data(using: .utf8)!
                //epgAvialble?.data(using: .utf8)!

                let decodedData = try JSONDecoder().decode(EpgCardV2.self,
                                                           from: epgv2Data)
                self.epgAvailable = decodedData.epgAvailable
                print("epgAvailable?.CanShowEPG : \(self.epgAvailable?.CanShowEPG)")
                if self.epgAvailable?.CanShowEPG == true {
                    DispatchQueue.main.async { [self] in
                        if let epgVC = mEpgController {
                            //                        epgVC.view.backgroundColor = .blue
                            //                        epgVC.loadViewIfNeeded()
                            epgVC.setupLayout()
                            self.appController?.navigationController.pushViewController(epgVC, animated: true)
                        }
                    }
                }
            }
            catch {
                print(error)
            }
            
        }
        
        jsContext.setObject(unsafeBitCast(getAvailableShows, to: AnyObject.self), forKeyedSubscript: "getAvailableShows" as (NSCopying & NSObjectProtocol))
    }
}
