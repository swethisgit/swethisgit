//
//  ViewController.swift
//  ImageAnimation
//
//  Created by Sweda Thiyagarajan on 05/06/2023.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var imageView : UIImageView?
    
    var imageListArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for countValue in 0...16
        {
            var strImageName : String = "WhitePlay\(countValue).png"
            var image  = UIImage(named:strImageName)
            if let image = image {
                imageListArray.append(image)
            }
        }
        
        self.imageView?.animationImages = imageListArray
        self.imageView?.animationDuration = 2.5
        self.imageView?.startAnimating()
    }

    func animatedImages(for name: String) -> [UIImage] {
        
        var i = 0
        var images = [UIImage]()
        
        while let image = UIImage(named: "\(name)/\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
    
}

