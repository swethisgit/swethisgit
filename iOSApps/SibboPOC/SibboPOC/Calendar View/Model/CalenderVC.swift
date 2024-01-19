//
//  ViewController.swift
//  myCalender2
//
//  Created by Muskan on 10/22/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import UIKit

enum MyTheme {
    case light
    case dark
}

class CalenderVC: UIViewController, CalenderDelegate {
    
//    var calendarObject : HolidayBaseRes?

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.title = "Calender"
        self.view.backgroundColor = Style.bgColor
        
        view.addSubview(calenderView)
        calenderView.delegate = self
        calenderView.daysObject = self.calendarObject
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        if self.calendarObject != nil {
            NotificationCenter.default.post(name: Notification.Name("calendarObject"), object: self.calendarObject)
        }

        
        let holidaysRoundedlabel = UILabel(frame: CGRect(x: self.view.frame.origin.x+40, y: 400, width: 20, height: 20))
        holidaysRoundedlabel.backgroundColor = Colors.darkGreen
        holidaysRoundedlabel.layer.cornerRadius = holidaysRoundedlabel.frame.size.height/2.0
        holidaysRoundedlabel.layer.masksToBounds = true
        self.view.addSubview(holidaysRoundedlabel)
        
        let holidayslabel = UILabel(frame: CGRect(x: 70, y: 400, width: 100, height: 20))
        holidayslabel.textAlignment = .left
        holidayslabel.font = UIFont.init(name: "Helvetica-Bold", size: 15)
        holidayslabel.textColor = UIColor.black
        holidayslabel.text = "Holidays"
        self.view.addSubview(holidayslabel)
        
        let specialEvtRoundedlabel = UILabel(frame: CGRect(x: self.view.frame.width-180, y: 400, width: 20, height: 20))
        specialEvtRoundedlabel.backgroundColor = Colors.darkRed
        specialEvtRoundedlabel.layer.cornerRadius = holidaysRoundedlabel.frame.size.height/2.0
        specialEvtRoundedlabel.layer.masksToBounds = true
        self.view.addSubview(specialEvtRoundedlabel)
        
        let specialEvlabel = UILabel(frame: CGRect(x: self.view.frame.width-150, y: 400, width: 120, height: 20))
        specialEvlabel.textAlignment = .left
        specialEvlabel.font = UIFont.init(name: "Helvetica-Bold", size: 15)
        specialEvlabel.textColor = UIColor.black
        specialEvlabel.text = "Special Events"
        self.view.addSubview(specialEvlabel)
       
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightBarBtnAction))
//
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }

    
    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
         print(123)
    }
    
    @objc func dismissVC(sender: UIBarButtonItem) {
       self.dismiss(animated: true, completion: nil)
    }

    
    lazy var  calenderView: CalenderView = {
        let calenderView = CalenderView(theme: MyTheme.light)
        calenderView.translatesAutoresizingMaskIntoConstraints=false
        return calenderView
    }()
    
    func didTapDate(date: String, available: Bool) {
        if available == true {
           // print(date)
        } else {
            showAlert(date)
        }
    }
    
  
   
    fileprivate func showAlert(_ str : String){
        let alert = UIAlertController(title: str, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

