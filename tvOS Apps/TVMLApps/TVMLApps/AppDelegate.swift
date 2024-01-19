//
//  AppDelegate.swift
//  TVMLApps
//
//  Created by Sweda Thiyagarajan on 11/05/2022.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    var appController: TVApplicationController?
    var mImageDelegate: ImageDelegate?
    var imagePath: String?
    static var tvBaseURL = "http://192.168.1.14:9001/"
    static var tvBoostURL = "\(AppDelegate.tvBaseURL)js/application.js"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tvAppControllerContext = TVApplicationControllerContext()
        guard let javascriptURL = URL(string: AppDelegate.tvBoostURL) else {
            fatalError("Error in js")
        }
        tvAppControllerContext.javaScriptApplicationURL = javascriptURL
        tvAppControllerContext.launchOptions["BASEURL"] = AppDelegate.tvBaseURL
       appController = TVApplicationController(context: tvAppControllerContext, window: window, delegate: self)
        
        print(" load aaap")
        return true
    }
    
    func appController(_ appController: TVApplicationController, evaluateAppJavaScriptIn jsContext: JSContext) {
        
        mImageDelegate = ImageDelegate()
        mImageDelegate?.imageGradientController(appController, evaluateAppInJSContext: jsContext, self)
//        imagePath = "http://192.168.1.14:9001/images/vicki.png"
//        if let _ = imagePath {
//            loadGradientController()
//        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    
//    func loadGradientController() {
//        DispatchQueue.main.async {
//            if let imgController = UIStoryboard(name: "GradeImageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GradeImageViewController") as? GradeImageViewController {
//                if let navigator =   self.appController?.navigationController {
//                    imgController.imaPath = "\(AppDelegate.tvBaseURL)images/\(imgToLoad!)"
//                    if let topVC  = navigator.topViewController {
//                        topVC.present(imgController, animated: true, completion: nil)
//                    }
//                    navigator.topViewController?.present(imgController, animated: false, completion: nil)
//                    navigator.present(imgController, animated: false, completion: nil)
//                    navigator.pushViewController(imgController, animated: true)
//                }
//            }
//        }
//    }
}

