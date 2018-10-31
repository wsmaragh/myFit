//
//  UIViewController+.swift
//  myFit
//
//  Created by Winston Maragh on 10/31/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

extension UIViewController {
    static func storyboardInstance(storyboardName: String, viewControllerIdentifiier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifiier)
        return viewController
    }
}
