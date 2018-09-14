//
//  LoginVC.swift
//  Fit
//
//  Created by Winston Maragh on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    


}
