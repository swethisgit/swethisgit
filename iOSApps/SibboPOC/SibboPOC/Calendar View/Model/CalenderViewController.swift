//
//  CalenderViewController.swift
//  ChaloApp
//
//  Created by Good on 19/04/20.
//  Copyright © 2020 karshatech. All rights reserved.
//

import UIKit


class CalenderViewController: PageController{

    var eventResObject : HolidayBaseRes?

    
    var menuViewPosition: MenuViewPosition?
        var index = 0
        
        lazy var redView: UIView = {
            let view = UIView(frame: CGRect.zero)
            view.backgroundColor = UIColor(red: 168.0/255.0, green: 20.0/255.0, blue: 4/255.0, alpha: 1)
            return view
        }()
        
        @objc func btnMethod() {
            index += 1
            self.reloadData()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setBackButton()
            self.requestEventSession()
            if self.menuViewStyle == .triangle {
                self.view.addSubview(self.redView)
            }
            
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
          //  self.redView.frame = CGRect(x: 0, y: (self.menuView?.frame.maxY) ?? 0, width: self.view.frame.width, height: 2.0)
    
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func numbersOfChildControllersInPageController(_ pageController: PageController) -> Int {
            switch self.menuViewStyle {
            case .flood:
                return 3 + index
            case .segmented:
                return 3 + index
            default:
                return 3 + index
            }
        }
        
        func pageController(_ pageController: PageController, titleAtIndex index: Int) -> String {
            switch index % 3 {
            case 0:return "CALENDAR"
            case 1:return "HOLIDAY"
            default:return "SPECIAL EVENT"
            }
        }
        
        func pageController(_ pageController: PageController, viewControllerAtIndex index: Int) -> UIViewController {
            switch index % 3 {
            case 0:
                let calVC = CalenderVC()
                calVC.calendarObject = eventResObject
                return calVC
            case 1:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                var homeVC : HolidayViewController? = nil
                homeVC = storyboard.instantiateViewController(withIdentifier: "HolidayViewController") as? HolidayViewController
               
                homeVC?.holidayResObject = eventResObject
                let naviBar = UINavigationController(rootViewController: homeVC!)
                return naviBar
            case 2:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                var homeVC : SpecialEventViewController? = nil
                homeVC = storyboard.instantiateViewController(withIdentifier: "SpecialEventViewController") as? SpecialEventViewController
                homeVC?.sepcialEvtResObject = eventResObject
                 let naviBar = UINavigationController(rootViewController: homeVC!)
                return naviBar
            default:
                return UIViewController()
            }
        }
        
        override func menuView(_ menu: MenuView, widthForItemAtIndex index: Int) -> CGFloat {
            let width = super.menuView(menu, widthForItemAtIndex: index)
            return width + 20
        }
        
        override func pageController(pageController: PageController, preferredFrameForMenuView menuView: MenuView?) -> CGRect {
            if self.menuViewPosition == .bottom {
                menuView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
                return CGRect(x: 0, y: self.view.frame.size.height - 44, width: self.view.frame.width, height: 44)
            }
            let leftMargin: CGFloat = self.showOnNavigationBar ? 50 : 0
            let originY = self.showOnNavigationBar ? 0 : self.navigationController?.navigationBar.frame.maxY
            
            
            return CGRect(x: 0, y: originY ?? 0, width: self.view.frame.width - 2 * leftMargin, height: 44)
        }
        
        override func pageController(pageController: PageController, preferredFrameForContentView scrollView: WMScrollView?) -> CGRect {
            if self.menuViewPosition == .bottom {
                return CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height - 64 - 44)
            }
            var originY = self.pageController(pageController: pageController, preferredFrameForMenuView: self.menuView ?? nil).maxY
            if self.menuViewStyle == .triangle {
                originY += self.redView.frame.height
            }
            return CGRect(x: 0, y: originY , width: self.view.frame.width, height: self.view.frame.height - originY)
        }
        
        func pageController(_ pageController: PageController, didEnterViewController viewController: UIViewController, withInfo info: Dictionary<String, String>) {
    //        print("info = \(info) ====viewController = \(viewController)")
        }
        
        func pageController(_ pageController: PageController, lazyLoadViewController viewController: UIViewController, withInfo info: Dictionary<String, String>) {
    //         print("info = \(info) ====viewController = \(viewController)")
        }
        
        func pageController(_ pageController: PageController, willEnterViewController viewController: UIViewController, withInfo info: Dictionary<String, String>) {
           // print("info = \(info) ====viewController = \(viewController)")
        }

  
         func requestEventSession () {
            let academicYear : Int = AppDelegate.instance().userdefault.value(forKey: defaultsKeys.academicYearIdBa) as? Int ?? defaultAcademicYear

             let params : [String: Any] = ["StudentID": super.loginDetails.studentId! ,"ClassID" : super.loginDetails.classId ?? 0,"DbPrefix":super.loginDetails.DBPrefix!,"AcademicYearID":academicYear]
             print(params)
            
                let jsonString  = super.JSONStringify(params)
                let finalRequest : [String: Any] = [REQUEST_BODY:jsonString]
                 Network.networkManager.request(post: HOLIDAY_END, checkURL: true ,params: finalRequest, authorizationRequired: true, blockUser: true, success: { (response,jsonData)  in
                             self.handlePaymentSuccess(response , jsonData)
                          }, failure: { (error) in
                              super.showAlertController(errorAlert_Info, message: NETWORKFAILURE)
                 })
          }
         
         func handlePaymentSuccess(_ dataObject : [String : Any],_ jsonData : AnyObject) {
              //  print(dataObject["d"])
                  if let dataObject = HolidayBaseRes(jsonData) {
                        self.eventResObject = dataObject
                         self.reloadData()
                  }else{
                        
                  }
          }
}
