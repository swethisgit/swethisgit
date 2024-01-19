//
//  ViewController.swift
//  EPGPOC
//
//  Created by Sweda Thiyagarajan on 31/03/2022.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var HStack: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var VStack: UIStackView!
    var colorView : NewView!
    var viewStack = [NewView]()
    let fixedheight:CGFloat = 90
    let fixedWidth:CGFloat = 250
    let noOfShows = 3
    var timer : Timer?
    
    override func viewDidLoad() {
        timer = Timer.scheduledTimer(timeInterval:3, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)

    }
    
    @objc func prozessTimer() {
        scrollView.contentOffset.x += 30
    }
    
    override func viewWillLayoutSubviews() {
        let c = VStack.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        c.priority = UILayoutPriority(rawValue: 750)
        c.isActive = true
        
        let w = HStack.heightAnchor.constraint(equalTo: scrollView.widthAnchor)
        w.priority = UILayoutPriority(rawValue: 750)
        w.isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for _ in 0...noOfShows {
            addView()
        }
    }
    
    func addView() {
        //Set color view
        colorView = NewView()
        colorView.frame.size = CGSize(width: fixedWidth, height: fixedheight)
        colorView.frame.origin.x = CGFloat(count) * fixedWidth
        getColor()
        
        //Set scroll view height
        incScrollHeight()
        
        HStack.addSubview(colorView)
        viewStack.append(colorView)
    }
    
    func getColor () {
        switch count%7 {
            case 0:
                colorView.backgroundColor = .systemCyan
            case 1:
                colorView.backgroundColor = .systemRed
            case 2:
                colorView.backgroundColor = .orange
            case 3:
                colorView.backgroundColor = .systemGreen
            case 4:
                colorView.backgroundColor = .green
            case 5:
                colorView.backgroundColor = .systemBlue
            case 6:
                colorView.backgroundColor = .blue
            default:
                colorView.backgroundColor = .white
        }
        count += 1
    }
    
    func incScrollHeight() {
        if colorView.frame.origin.x > self.view.frame.size.width {
            scrollView.contentSize.width += fixedWidth
        } else if (colorView.frame.origin.x + colorView.frame.size.width) > self.view.frame.size.width{
            let missingWidth = (colorView.frame.origin.x + colorView.frame.size.width) - self.view.frame.size.width
            scrollView.contentSize.width += missingWidth
        }
    }
}

