//
//  ViewController.swift
//  DynamicStackViews
//
//  Created by Sweda Thiyagarajan on 20/07/2021.
//

import UIKit

class DynamicStackViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let insets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets

    }

    @IBAction func addEntry(_ sender: Any) {
        
        if let stack = stackView {
            let index = stack.arrangedSubviews.count - 1
            let addView = stack.arrangedSubviews[index]
            
            if let scroll = scrollView {
                let offset = CGPoint(x: scroll.contentOffset.x,
                                     y: scroll.contentOffset.y + addView.frame.size.height)
                
                let newView = createEntry()
                newView.isHidden = true
                stack.insertArrangedSubview(newView, at: index)
                
                UIView.animate(withDuration: 0.25) { () -> Void in
                    newView.isHidden = false
                    scroll.contentOffset = offset
                }
            }
        }
    }
    
    @objc func deleteStackView(sender: UIButton) {
        if let view = sender.superview {
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                view.isHidden = true
            }, completion: { (success) -> Void in
                view.removeFromSuperview()
            })
        }
    }

    private func createEntry() -> UIView {
        let date = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .none)
        let number = "\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())"
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(self.deleteStackView(sender:)), for:.touchUpInside)
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    private func randomHexQuad() -> String {
        return NSString(format: "%X%X%X%X",
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16
            ) as String
    }
    

}

