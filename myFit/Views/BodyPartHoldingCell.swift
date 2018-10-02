//
//  aHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class BodyPartHoldingCell: UITableViewCell {

    @IBOutlet weak var BodyPartCollectionView: UICollectionView!
    
    static let id = "BodyPartHoldingCell"
    
    internal weak var viewController: UIViewController?
    
    private var bodyParts = ExerciseList.Group.allCases
    
    internal func configureCell(forCell cell: BodyPartHoldingCell){
        self.configureCollectionView(cell: cell)
    }

    private func configureCollectionView(cell: BodyPartHoldingCell){
        cell.BodyPartCollectionView.dataSource = self
        cell.BodyPartCollectionView.delegate = self
        let layout = cell.BodyPartCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: cellSpacing, left: 0.0, bottom: cellSpacing, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 4.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: BodyPartCollectionView.bounds.height)
    }
}


// MARK: Inner CollectionView
extension BodyPartHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
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

