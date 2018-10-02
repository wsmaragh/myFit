//  CollapsibleTableViewHeader.swift
//  TableView-Master
//  Created by Winston Maragh on 3/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.

import Foundation
import UIKit


protocol CollapsibleHeaderDelegate {
    func toggleSection(_ header: CollapsibleHeader, section: Int)
}


class CollapsibleHeader: UITableViewHeaderFooterView {
   
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var arrowLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "button_plus"), for: .normal)
        return button
    }()
    
    
    var delegate: CollapsibleHeaderDelegate?
    
    static let id = "CollapsibleHeader"

    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        contentView.backgroundColor = UIColor.gray
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleHeader.tapHeader(_:))))
        addLabel()
        addTitleLabel()
//        addAddButton()
    }
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleHeader else {return}
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
    private func addLabel(){
        contentView.addSubview(arrowLabel)
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        arrowLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        arrowLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    private func addTitleLabel(){
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
    }
    
//    private func addAddButton(){
//        contentView.addSubview(addButton)
//
//
//    }
    
    func configureCell(section: String) {
        titleLabel.text = section
        arrowLabel.text = ">"
    }
    
}
