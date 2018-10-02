//
//  bHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class MyWorkoutHoldingCell: UITableViewCell {

    @IBOutlet weak var MyWorkoutCollectionView: UICollectionView!
    
    static let id = "MyWorkoutHoldingCell"

    internal weak var viewController: UIViewController?
    
    private var workoutRoutines: [Routine] = DummyData.sampleMyWorkout
    
    internal func configureCell(forCell cell: MyWorkoutHoldingCell) {
        self.configureCollectionView(cell: cell)
    }
    
    private func configureCollectionView(cell: MyWorkoutHoldingCell){
        cell.MyWorkoutCollectionView.dataSource = self
        cell.MyWorkoutCollectionView.delegate = self
        let layout = cell.MyWorkoutCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: cellSpacing, bottom: 0.0, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 2.5
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: cell.MyWorkoutCollectionView.bounds.height)
    }
    
}


extension MyWorkoutHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutRoutines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyWorkoutCell.id, for: indexPath) as! MyWorkoutCell
        let workoutRoutine = workoutRoutines[indexPath.item]
        cell.layer.cornerRadius = 4
        cell.configureCell(workout: workoutRoutine)
        return cell
    }
    
}


