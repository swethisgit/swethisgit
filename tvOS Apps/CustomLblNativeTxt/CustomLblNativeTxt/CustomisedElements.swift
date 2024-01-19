//
//  CustomiseLabel.swift
//  CustomLblNativeTxt
//
//  Created by Sweda Thiyagarajan on 18/05/2022.
//

import UIKit
import TVMLKit

class CustomisedElements : TVInterfaceFactory {
    static let labelName = "copyright"
    static let customImage = "GradientImage"
    static let countryAttribute = "country-name"
    static let widthAttribute = "width"
    static let heightAttibute = "height"
    static let srcAttribute = "src"
    
    let parentElement = "banner"
    var imageView : UIImageView!
    var gradeView : UIView! = nil
    var countryLbl : UILabel! = nil
    
   override func makeView(element: TVViewElement, existingView: UIView?) -> UIView? {
       print("name : \(element.name)")
       if element.name == CustomisedElements.labelName {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .red
            label.textAlignment = NSTextAlignment.center
            label.text = "Copyright information"
            return label
       } else if element.name == parentElement {
           if let child = element.children?[0] {
               if let gChild = child.children?[0] {
                   if  gChild.name == CustomisedElements.customImage {
                       let gradientElement = gChild
                       if let attributes = gradientElement.attributes, let width = attributes[CustomisedElements.widthAttribute], let height = attributes[CustomisedElements.heightAttibute], let imgPath = attributes[CustomisedElements.srcAttribute], let country = attributes[CustomisedElements.countryAttribute]  {
                           
                           createAndLoadImage(viewWith: (Int(width) ?? 200, Int(height) ?? 200), path: imgPath)
                           
//                           createGradientLayer(viewWith: (Int(width) ?? 200, Int(height) ?? 200), colors: [.init(red: 255, green: 255, blue: 0, alpha: 1)])
                           
                           createCountryLbl(withName: country)
                          
//                           imageView.addSubview(countryLbl)
//                           imageView.addSubview(gradeView)
                          

                           return imageView
                       }
                   }
               }
           }
       }
        return nil
    }
    
    func createAndLoadImage(viewWith givenSize : (width: Int, height: Int) , path toLoad: String) {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: givenSize.width, height: givenSize.height))
       loadFrom(imageView : imageView, URLAddress: toLoad)
       imageView.backgroundColor = .clear
        imageView.alpha = 0.2
       imageView.isOpaque = false
       imageView.layer.opacity = 0.3
    }
    
    func loadFrom(imageView : UIImageView,  URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        if let imageData = try? Data(contentsOf: url) {
            if let loadedImage = UIImage(data: imageData) {
                imageView.image = loadedImage
            }
        }
    }
    
    func createGradientLayer(viewWith givenSize : (width: Int, height: Int), colors: [CGColor]){
        gradeView = UIView(frame: CGRect(x: 0, y: 0, width: givenSize.width, height: givenSize.height))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width:givenSize.width, height: givenSize.height)
        gradientLayer.colors = [UIColor.white.cgColor,UIColor.yellow.withAlphaComponent(0.5).cgColor]
        gradientLayer.opacity = 0.7
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradeView.isOpaque = false
        gradeView.alpha = 0.7
        gradeView.layer.addSublayer(gradientLayer)
    }
    
    func createCountryLbl(withName countryName: String) {
        countryLbl = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 70))
        countryLbl.backgroundColor = .clear
        countryLbl.font = UIFont.boldSystemFont(ofSize: 26)
        countryLbl.textColor = .black
        countryLbl.textAlignment = NSTextAlignment.center
        countryLbl.text = countryName
        countryLbl.sizeToFit()
    }

}
