//
//  ViewController.swift
//  EPGPOC
//
//  Created by Sweda Thiyagarajan on 31/03/2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var count = 0
    
    @IBOutlet weak var logoScrollView: UIScrollView!
    @IBOutlet weak var logoStackView: UIStackView!
    @IBOutlet weak var channelStackView: UIStackView!
    @IBOutlet weak var channelScrollView: UIScrollView!
    
    var showIndicatorImg : UIImageView!
    
    var colorView : NewView!
    
    var showStackView : UIStackView!
    
    let fixedheight:CGFloat = 90
    let fixedWidth:CGFloat = 250
    let noOfShows = 10
    let noOfChanels = 13
    
    
    var maxShows = 0
    var timer : Timer?
    
    let imageWidth:CGFloat = 90
    let imageHeight:CGFloat = 90
    
    override func viewDidLoad() {
        timer = Timer.scheduledTimer(timeInterval:3, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)
    }
    
    @objc func prozessTimer() {
        showIndicatorImg.frame.origin.x += 30
    }
    
    override func viewWillLayoutSubviews() {
//        let c = channelStackView.heightAnchor.constraint(equalTo: channelScrollView.heightAnchor)
//        c.priority = UILayoutPriority(rawValue: 750)
//        c.isActive = true
//        
//
//        let w = channelStackView.widthAnchor.constraint(equalTo: channelScrollView.widthAnchor)
//        w.priority = UILayoutPriority(rawValue: 750)
//        w.isActive = true
//
        let l = logoStackView.heightAnchor.constraint(equalTo: logoScrollView.heightAnchor)
        l.priority = UILayoutPriority(rawValue: 750)
        l.isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        logoStackView.backgroundColor = .cyan
        for x in 0...noOfChanels {
            addChannel(channelNo: CGFloat(x))
            addChannelLogo(channelNo: CGFloat(x))
            incScrollHeight()
        }
        channelScrollView.contentSize.height += 40
        showIndicatorImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: channelScrollView.contentSize.height))
        showIndicatorImg.contentMode = .scaleToFill
        showIndicatorImg.image = UIImage(systemName: "arrow.down.to.line.alt")
        showIndicatorImg.backgroundColor = .red
        channelScrollView.addSubview(showIndicatorImg)
        
        showIndicatorImg.topAnchor.constraint(equalTo: channelScrollView.topAnchor).isActive = true
    }
    
    func addShows(forShow showNo: Int) {
        //Set color view
        let nib = UINib(nibName: "NewView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! NewView
        colorView = nib
        colorView.frame.size = CGSize(width: fixedWidth, height: fixedheight)
        colorView.frame.origin.x = CGFloat(count) * fixedWidth
        colorView.baseViewController = self
        getColor()
        
        //Set scroll view width
        if maxShows < showNo {
            maxShows = showNo
            incScrollWidth()
        }
        
        showStackView.addSubview(colorView)
    }
    
    func addChannelLogo(channelNo : CGFloat) {
        var y = channelNo * imageHeight
         y += (y != 0 ? 30*channelNo : 0)
        
        let view = UIView(frame: CGRect(x: 0, y: y, width: imageWidth, height: imageWidth))
        let logoImage = UIImageView(frame: CGRect( x: 0, y: 0, width: imageWidth, height: imageWidth ))
        logoImage.image = UIImage(systemName:  "sun.max.fill")
        logoImage.backgroundColor = .green
        logoImage.tintColor = .orange
        view.backgroundColor = .yellow
        view.addSubview(logoImage)

        logoStackView.addSubview(view)

    }
    
    func addChannel(channelNo : CGFloat) {
        var y = channelNo * fixedheight
         y += (y != 0 ? 30*channelNo : 0)
        
        
        showStackView = nil
        showStackView = UIStackView()
        showStackView.frame = CGRect(x: 0, y: y, width: self.view.frame.size.width, height: fixedheight)
        showStackView.axis = .horizontal
        for showNo in 0...noOfShows {
            addShows(forShow: showNo)
        }
        count = 0

        channelStackView.addSubview(showStackView)
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
        
    func incScrollWidth() {
        if colorView.frame.origin.x > self.view.frame.size.width {
            channelScrollView.contentSize.width += fixedWidth
//            channelStackView.frame.size.width = channelScrollView.contentSize.width
            
        } else if (colorView.frame.origin.x + colorView.frame.size.width) > self.view.frame.size.width{
            let missingWidth = (colorView.frame.origin.x + colorView.frame.size.width) - self.view.frame.size.width
            channelScrollView.contentSize.width += missingWidth + 90
//            channelStackView.frame.size.width = channelScrollView.contentSize.width

        }
    }
    
    func incScrollHeight() {
        if showStackView.frame.origin.y > self.view.frame.size.height {
//            channelStackView.frame.size.height += fixedheight
            channelScrollView.contentSize.height += fixedheight + 30
            logoScrollView.contentSize.height += imageHeight + 30
//            showIndicatorImg.frame.size.height += fixedheight
        } else if (showStackView.frame.origin.y + showStackView.frame.size.height) > self.view.frame.size.height{
            let missingHeight = (showStackView.frame.origin.y + showStackView.frame.size.height) - self.view.frame.size.height
//            channelStackView.frame.size.height  += missingHeight
            channelScrollView.contentSize.height += missingHeight + 30
            logoScrollView.contentSize.height += missingHeight + 30

//            arrowImg.frame.size.height += missingHeight
        }
    }
    
  
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        channelScrollView.contentOffset.y = scrollView.contentOffset.y
        logoScrollView.contentOffset.y = scrollView.contentOffset.y
    }
    

}

