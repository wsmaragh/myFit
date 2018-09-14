//
//  HeaderCell.swift
//  Fit
//
//  Created by C4Q on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class HeaderCell: UITableViewCell {

	@IBOutlet weak var headerLabel: UILabel!
	@IBOutlet weak var addButton: UIButton!

    static let id = "HeaderCell"

    
	@IBAction func addButtonPressed() {
		//TODO: Add new cell row

	}

    func configureCell(headerLabelStr: String) {
        headerLabel.text = headerLabelStr
    }
    
}
