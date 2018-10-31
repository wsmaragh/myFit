//
//  cHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class SuggestedHoldingCell: UITableViewCell {

    @IBOutlet weak var SuggestedCollectionView: UICollectionView!
    
    static var cellID: String {
        return String(describing: self)
    }
    
    internal weak var viewController: UIViewController?    
    
    private var workoutRoutines: [Routine] = DummyData.sampleSuggestedWorkout
    
    internal func configureCell(forCell cell: SuggestedHoldingCell) {
        self.configureCollectionView(cell: cell)
    }
    
    private func configureCollectionView(cell: SuggestedHoldingCell){
        cell.SuggestedCollectionView.dataSource = self
        cell.SuggestedCollectionView.delegate = self
        let layout = cell.SuggestedCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: cellSpacing, bottom: 0.0, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 2.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: cell.SuggestedCollectionView.bounds.height)
    }
    
}


extension SuggestedHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutRoutines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestedCell.cellID, for: indexPath) as! SuggestedCell
        let workoutRoutine = workoutRoutines[indexPath.item]
        cell.layer.cornerRadius = 4
        cell.configureCell(workout: workoutRoutine)
        return cell
    }
    
}

