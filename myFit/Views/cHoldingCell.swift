//
//  cHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class cHoldingCell: UITableViewCell {

    @IBOutlet weak var cCollectionView: UICollectionView!
    
    static let id = "cHoldingCell"

    internal weak var viewController: UIViewController?    
    
    private var workoutRoutines: [Routine] = DummyData.sampleSuggestedWorkout
    
    internal func configureCell(forCell cell: cHoldingCell) {
        self.configureCollectionView(cell: cell)
    }
    
    private func configureCollectionView(cell: cHoldingCell){
        cell.cCollectionView.dataSource = self
        cell.cCollectionView.delegate = self
        let layout = cell.cCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: cellSpacing, bottom: 0.0, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 2.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: cell.cCollectionView.bounds.height)
    }
    
}


extension cHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutRoutines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cCell", for: indexPath) as! cCell
        let workoutRoutine = workoutRoutines[indexPath.item]
        cell.layer.cornerRadius = 4
        cell.configureCell(workout: workoutRoutine)
        return cell
    }
    
}

