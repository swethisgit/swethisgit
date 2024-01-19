//
//  ViewController.swift
//  TVMLApps
//
//  Created by Sweda Thiyagarajan on 11/05/2022.
//

import UIKit

class GradeImageViewController: UIViewController {

    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var gradeMe: UIImageView!
    @IBOutlet weak var gradeView: UIView!
    var renderMe: String!
    var imaPath: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gradientImageWithBounds(bounds: gradeMe.bounds, colors: [.init(red: 255, green: 255, blue: 0, alpha: 1)])
        loadFrom(URLAddress: imaPath)
    }

    func gradientImageWithBounds(bounds: CGRect, colors: [CGColor])  {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: gradeMe.frame.size.width, height: gradeMe.frame.size.height)
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
                gradeMe.image = loadedImage
            }
        }
    }
}

