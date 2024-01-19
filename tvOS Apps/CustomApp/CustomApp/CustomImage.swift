//
//  CustomImage.swift
//  CustomApp
//
//  Created by Sweda Thiyagarajan on 16/05/2022.
//

import UIKit
import TVMLKit

class CustomImage : TVInterfaceFactory {
    
    static let templateName = "GradientImage"
    
    var imageToGrade = UIImageView()
    var imagePath : String!
    static var foundRequiredTag : Bool! = false
    static var requiredElement : TVViewElement?
    
    override func makeViewController(element: TVViewElement, existingViewController: UIViewController?) -> UIViewController? {
        
        
        let childrenCount = element.children?.count ?? 0
        print(childrenCount)
        
        if CustomImage.requiredElement == nil {
            print(element.name)
            if childrenCount > 0 {
                for i in 0..<childrenCount {
                    let child = element.children?[i]
                    if let grandChildren = child?.children {
                        if grandChildren.count > 0 {
                            for j in 0..<grandChildren.count {
                                let grandChild = grandChildren[j]
                                if let ggChild = grandChild.children {
                                    for k in 0..<ggChild.count {
                                        if  CustomImage.templateName == ggChild[k].name {
                                            CustomImage.requiredElement = ggChild[k]
                                            CustomImage.foundRequiredTag = true
                                            break;
                                        } else if CustomImage.foundRequiredTag {
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        guard  let requiredElement = CustomImage.requiredElement else {
            return nil
        }
        
        let tvmlController = existingViewController as? TVMLViewController ?? TVMLViewController()
        
        if let attributes = requiredElement.attributes, let width = attributes["width"], let height = attributes["height"], let imgPath = attributes["src"] {
            tvmlController.width = CGFloat(Double(width) ?? 500.0)
            tvmlController.height = CGFloat(Double(height) ?? 500.0)
            tvmlController.imagePath = imgPath
        } else {
            tvmlController.width = 500.0
            tvmlController.height = 500.0
            tvmlController.imagePath = "\(AppDelegate.tvBaseURL)images/vicki.png"
        }
        
        return tvmlController
    }
}
