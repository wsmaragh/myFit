//
//  aHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class aHoldingCell: UITableViewCell {

    @IBOutlet weak var aCollectionView: UICollectionView!
    
    static let id = "aHoldingCell"
    
    internal weak var viewController: UIViewController?
    
    private var bodyParts = ExerciseList.Group.allCases
    
    internal func configureCell(forCell cell: aHoldingCell){
        self.configureCollectionView(cell: cell)
    }

    private func configureCollectionView(cell: aHoldingCell){
        cell.aCollectionView.dataSource = self
        cell.aCollectionView.delegate = self
        let layout = cell.aCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: cellSpacing, left: 0.0, bottom: cellSpacing, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 4.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: aCollectionView.bounds.height)
    }
}


// MARK: Inner CollectionView
extension aHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bodyParts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BodyPartCell.id, for: indexPath) as! BodyPartCell
        let bodyPart = bodyParts[indexPath.item]
        cell.layer.cornerRadius = 4
        cell.configureCell(bodyPart: bodyPart)
        return cell
    }
    
}

