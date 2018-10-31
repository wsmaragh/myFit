//
//  UItextField+.swift
//  myFit
//
//  Created by Winston Maragh on 10/31/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

extension UITextField {
    
    func underlined(color: UIColor){
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setBottomLine(color: UIColor) {
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.backgroundColor = UIColor.white
        self.addSubview(borderLine)
    }
}
