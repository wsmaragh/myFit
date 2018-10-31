//
//  UIView+.swift
//  myFit
//
//  Created by Winston Maragh on 10/31/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
    
}
