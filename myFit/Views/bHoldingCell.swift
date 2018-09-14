//
//  bHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class bHoldingCell: UITableViewCell {

    @IBOutlet weak var bCollectionView: UICollectionView!
    
    static let id = "bHoldingCell"

    internal weak var viewController: UIViewController?
    
    private var workoutRoutines: [Routine] = DummyData.sampleMyWorkout
    
    internal func configureCell(forCell cell: bHoldingCell) {
        self.configureCollectionView(cell: cell)
    }
    
    private func configureCollectionView(cell: bHoldingCell){
        cell.bCollectionView.dataSource = self
        cell.bCollectionView.delegate = self
        let layout = cell.bCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: cellSpacing, bottom: 0.0, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 2.5
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: cell.bCollectionView.bounds.height)
    }
    
}


extension bHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutRoutines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bCell", for: indexPath) as! bCell
        let workoutRoutine = workoutRoutines[indexPath.item]
        cell.layer.cornerRadius = 4
        cell.configureCell(workout: workoutRoutine)
        return cell
    }
    
}


