//
//  TVMLViewController.swift
//  CustomApp
//
//  Created by Sweda Thiyagarajan on 16/05/2022.
//

import UIKit

class TVMLViewController: UIViewController {
    
    var width : CGFloat!
    var height : CGFloat!
    var imagePath : String!
    var imageView : UIImageView!
    var gradeView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.alpha = 1
        loadFrom(URLAddress: imagePath)
        
        gradeView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        gradeView.alpha = 1

        gradientImage(colors: [.init(red: 255, green: 255, blue: 0, alpha: 1)])
        
        imageView.addSubview(gradeView)
        
        view.addSubview(imageView)
    }
    
    func gradientImage( colors: [CGColor])  {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width:width, height: height)
        gradientLayer.colors = [UIColor.white.cgColor,UIColor.yellow.withAlphaComponent(0.5).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.gradeView.layer.addSublayer(gradientLayer)
    }
    
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        if let imageData = try? Data(contentsOf: url) {
            if let loadedImage = UIImage(data: imageData) {
                imageView.image = loadedImage
            }
        }
    }
}
