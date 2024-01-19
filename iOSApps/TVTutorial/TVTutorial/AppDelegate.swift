//
//  AppDelegate.swift
//  TVTutorial
//
//  Created by Sweda Thiyagarajan on 12/04/2022.
//

import UIKit
import TVMLKit

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    var appController : TVApplicationController?
    
    static let tvBaseURL = "http://localhost:9001/"
    static let tvBoostURL = "\(AppDelegate.tvBaseURL)js/application.js"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
      window = UIWindow(frame: UIScreen.main.bounds)

      let appControllerContext = TVApplicationControllerContext()

      guard let javaScriptURL = URL(string: AppDelegate.tvBoostURL) else { fatalError("unable to create NSURL") }
      appControllerContext.javaScriptApplicationURL = javaScriptURL
      appControllerContext.launchOptions["BASEURL"] = AppDelegate.tvBaseURL

      appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
      return true
    }
}

