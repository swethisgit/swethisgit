//
//  EPGComponent.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 18/06/2022.
//

import UIKit
import TVMLKit

class EPGComponent : TVInterfaceFactory {
    static let EPG = "EPG"
    var EPGController : EPGViewController?
    override func makeViewController(element: TVViewElement, existingViewController: UIViewController?) -> UIViewController? {
        if element.name == "card" {
            let childrenCount = element.children?.count ?? 0
            if childrenCount > 0 {
                for i in 0..<childrenCount {
                    print(" \(element.children?[i].name)")
                    if let name = element.children?[i].name, name == EPGComponent.EPG {
                         EPGController = existingViewController as? EPGViewController ?? EPGViewController()
                        return EPGController
                    }
                }
            }
        }
        return nil
    }
}

