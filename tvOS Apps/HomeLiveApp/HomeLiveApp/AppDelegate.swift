//
//  AppDelegate.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 11/04/2023.
//

import UIKit
import TVMLKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    var appController: TVApplicationController?
    var mEPGDatasource : EPGDatasource?
    var mEpgController : ViewController?
    static let tvBaseURL = "http://localhost:9001/"
    static let tvBootURL = "\(AppDelegate.tvBaseURL)/application.js"
    
    func executeRemoteMethod(_ methodName: String, completion: @escaping (Bool) -> Void) {
        appController?.evaluate(inJavaScriptContext: { (context: JSContext) in
            let appObject : JSValue = context.objectForKeyedSubscript("App")
            
            if appObject.hasProperty(methodName) {
                appObject.invokeMethod(methodName, withArguments: [])
            }
        }, completion: completion)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let appControllerContext = TVApplicationControllerContext()
        if let javaScriptURL = URL(string: AppDelegate.tvBootURL) {
            appControllerContext.javaScriptApplicationURL = javaScriptURL
        }
        
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.tvBaseURL as NSString
        
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        TVInterfaceFactory.shared().extendedInterfaceCreator = EPG()
        TVElementFactory.registerViewElementClass(TVViewElement.self, elementName: EPG.elementName)
        EPG.sharedInstance = self
        return true
    }
    
    func appController(_ appController: TVApplicationController, evaluateAppJavaScriptIn jsContext: JSContext) {
        EPGDatasource.sharedInstance = self
        mEPGDatasource = EPGDatasource()
         if #available(tvOS 13.0, *) {
             mEPGDatasource?.showDataSource(appController, evaluateAppJavaScriptIn: jsContext, self)
         } else {
             // Fallback on earlier versions
         }
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


}

