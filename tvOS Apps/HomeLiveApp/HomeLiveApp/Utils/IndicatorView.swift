//
//  IndicatorView.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 26/04/2023.
//

import Foundation
import UIKit

@IBDesignable class IndicatorView: UIView {
    // Enables more convenient access to layer

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    // implement cgcolorgradient in the next section
    @IBInspectable var startColor: UIColor? {
        didSet { gradientLayer.colors = cgColorGradient }
    }

    @IBInspectable var endColor: UIColor? {
        didSet { gradientLayer.colors = cgColorGradient }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 1.0) {
        didSet { gradientLayer.startPoint = startPoint }
    }

    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0) {
        didSet { gradientLayer.endPoint = endPoint }
    }

    // existing code
}

extension IndicatorView {
    // For this implementation, both colors are required to display
    // a gradient. You may want to extend cgColorGradient to support
    // other use cases, like gradients with three or more colors.
    internal var cgColorGradient: [CGColor]? {
        guard let startColor = startColor, let endColor = endColor else {
            return nil
        }
        
        return [startColor.cgColor, endColor.cgColor]
    }
}
