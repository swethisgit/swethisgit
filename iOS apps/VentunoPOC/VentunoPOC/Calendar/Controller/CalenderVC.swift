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
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calender"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = Style.bgColor
        
        
        view.addSubview(calenderView)
        calenderView.delegate = self
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
       

        let cancelButton:UIButton = UIButton(type: .custom)
        cancelButton.setTitleColor(.darkGray, for: .normal)
        cancelButton.setTitle("CANCEL", for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        cancelButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        cancelButton.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)

        let confirmButton:UIButton = UIButton()
        confirmButton.backgroundColor = UIColor.init(red: 161.0/255.0, green: 25.0/255, blue: 36.0/255, alpha: 1)
        confirmButton.titleLabel?.textColor = .white
        confirmButton.setTitle("CONFIRM", for: .normal)
        confirmButton.layer.cornerRadius = 5
        confirmButton.layer.masksToBounds = true
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        confirmButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        confirmButton.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 5
        stackView.addArrangedSubview(cancelButton)
        stackView.addArrangedSubview(confirmButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)

        //Constraints
        stackView.topAnchor.constraint(equalTo: calenderView.bottomAnchor, constant: 10).isActive=true
        stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -40).isActive = true

    }
    
    @objc func buttonClicked() {
             print("Button Clicked")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }

    lazy var  calenderView: CalenderView = {
        let calenderView = CalenderView(theme: MyTheme.light)
        calenderView.translatesAutoresizingMaskIntoConstraints=false
        return calenderView
    }()
    
    func didTapDate(date: String, available: Bool) {
        if available == true {
            print(date)
        } else {
            showAlert()
        }
    }
    
  
   
    fileprivate func showAlert(){
        let alert = UIAlertController(title: "Unavailable", message: "This slot is already booked.\nPlease choose another date.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

