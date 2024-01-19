//
//  ViewController.swift
//  StackInScrollPOC
//
//  Created by Sweda Thiyagarajan on 31/03/2022.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var HStack: UIStackView!
    var colorView : NewView!
    var viewStack = [NewView]()
    let fixedSize:CGFloat = 100
    
    override func viewDidLayoutSubviews() {
        let c = HStack.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        c.priority = UILayoutPriority(rawValue: 750)
        c.isActive = true
    }
    
    @IBAction func AddView(_ sender: UIButton) {
        //Set color view
        colorView = NewView()
        colorView.frame.size = CGSize(width: self.view.frame.self.width, height: fixedSize)
        colorView.frame.origin.y = (CGFloat(count) * fixedSize) + 20
        getColor()
        
        //Set scroll view height
        incScrollHeight()
        
        HStack.addSubview(colorView)
        HStack.spacing = 20
        viewStack.append(colorView)
    }
    
    @IBAction func RemoveView(_ sender: UIButton) {
        if count > 0 {
            colorView = viewStack[count-1]
            colorView.removeFromSuperview()
            viewStack.remove(at: count - 1)
            count -= 1
            
            //Set scroll view height
            decScrollHeight()

        }
    }
    
    func getColor () {
        switch count%7 {
            case 0:
                colorView.backgroundColor = .yellow
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
        if colorView.frame.origin.y > self.view.frame.size.height {
            scrollView.contentSize.height += fixedSize
        } else if (colorView.frame.origin.y + colorView.frame.size.height) > self.view.frame.size.height{
            let missingHeight = (colorView.frame.origin.y + colorView.frame.size.height) - self.view.frame.size.height
            scrollView.contentSize.height += missingHeight
        }
    }
    
    func decScrollHeight() {
        if colorView.frame.origin.y > self.view.frame.size.height {
            scrollView.contentSize.height -= fixedSize
        } else if (colorView.frame.origin.y + colorView.frame.size.height) > self.view.frame.size.height{
            let missingHeight = (colorView.frame.origin.y + colorView.frame.size.height) - self.view.frame.size.height
            scrollView.contentSize.height -= missingHeight
        }
    }
}

