//
//  AppDelegate.swift
//  ApplePayIntvOSPOC
//
//  Created by Sweda Thiyagarajan on 06/05/2022.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    
    var window: UIWindow?
    var appController : TVApplicationController?
    var applePayDelegate: ApplePayDelegate?

    static let tvBaseURL = "http://localhost:9001/"
    static let tvBoostURL = "\(AppDelegate.tvBaseURL)js/application.js"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)-> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        applePayDelegate = ApplePayDelegate()
        applePayDelegate?.payController(self)
        
        
//        guard let javascriptURL = URL(string: AppDelegate.tvBoostURL) else {
//            fatalError("unable to create NSURL")
//        }
//
//        appControllerContext.javaScriptApplicationURL = javascriptURL
//        appControllerContext.launchOptions["BASEURL"] = AppDelegate.tvBaseURL
//        if let options = launchOptions {
//            for (kind, value) in options {
//                if let kindStr = kind as? String {
//                    appControllerContext.launchOptions[kindStr] = value
//                }
//            }
//        }
//
//        self.appController = TVApplicationController(context: appControllerContext, window: self.window, delegate: self)
        
        return true
    }
    
    func appController(_ appController: TVApplicationController, evaluateAppJavaScriptIn jsContext: JSContext) {

        applePayDelegate = ApplePayDelegate()
        applePayDelegate?.payController(self)
    }
}

