//
//  UIView+.swift
//  TestFramework
//
//  Created by Cong Bui Thanh on 04/07/2023.
//

import Foundation
import UIKit

public extension UIView {
    func roundedUsingWidth() {
        self.rounded(cornerRadius: self.frame.size.width / 2)
    }
    
    func roundedUsingHeight() {
        self.rounded(cornerRadius: self.frame.size.height / 2)
    }
    
    func rounded(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func round(corners: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
}

extension UIView {
    
//    func applyGradient(colors: [UIColor],
//                       startPoint: CGPoint = .zero,
//                       endPoint: CGPoint = CGPoint(x: 1, y: 1)) {
//        for subLayer in layer.sublayers ?? [] where subLayer is CAGradientLayer {
//            subLayer.removeFromSuperlayer()
//        }
//        let gradient = CAGradientLayer().then {
//            $0.frame = bounds
//            $0.colors = colors.map { $0.cgColor }
//            $0.startPoint = startPoint
//            $0.endPoint = endPoint
//        }
//        layer.insertSublayer(gradient, at: 0)
//    }
    
    func removeGradient() {
        for subLayer in layer.sublayers ?? [] where subLayer is CAGradientLayer {
            subLayer.removeFromSuperlayer()
        }
    }
}

// MARK: - Shadow
extension UIView {
    
    func applySketchShadow(color: UIColor = .black,
                           alpha: Float = 0.5,
                           x: CGFloat = 0,
                           y: CGFloat = 2,
                           blur: CGFloat = 4,
                           spread: CGFloat = 0) {
        self.layer.applySketchShadow(color: color, alpha: alpha, x: x, y: y, blur: blur, spread: spread)
    }

    func dropShadow(shadowRadius : Double, offsetWidth: Double, offsetHeight : Double, color: UIColor = UIColor.gray) {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        self.layer.shadowRadius = CGFloat(shadowRadius)

        self.layer.shouldRasterize = true

        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension CALayer {
    
    func applySketchShadow(color: UIColor = .black,
                           alpha: Float = 0.5,
                           x: CGFloat = 0,
                           y: CGFloat = 2,
                           blur: CGFloat = 4,
                           spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

// MARK: - Screen shot
extension UIView {
    
    func snapshot() -> UIImage? {
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

// MARK: - View Controller
extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}

