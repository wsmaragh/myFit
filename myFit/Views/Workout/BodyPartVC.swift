//
//  BodyPartVC.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class BodyPartVC: UIViewController {

    @IBOutlet weak var bodyPartCollectionView: UICollectionView!
    @IBOutlet weak var bodyPartTableView: UITableView!
    
    private var exercises = [Exercise]() {
        didSet {
            animateTable()
        }
    }
    
    private var exercisesData: [ExerciseList.Group : [Exercise]] = [:]
    
    private var bodyparts = ExerciseList.Group.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
        loadExercises()
    }
    
    private func setupTableView() {
        bodyPartTableView.delegate = self
        bodyPartTableView.dataSource = self
    }
    
    private func setupCollectionView() {
        bodyPartCollectionView.delegate = self
        bodyPartCollectionView.dataSource = self
        let layout = bodyPartCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: cellSpacing, left: 0.0, bottom: cellSpacing, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 4.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: bodyPartCollectionView.bounds.height - (cellSpacing * 3))
    }
    
    private func loadExercises(){
        exercises = DatabaseJSON.absExercises
    }

    func animateTable() {
        bodyPartTableView.reloadData()
        let cells = bodyPartTableView.visibleCells
        let tableHeight: CGFloat = bodyPartTableView.bounds.size.height
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
    }
    
    deinit {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailExerciseVC = segue.destination as? ExerciseDetailVC else {print("Error downcasting destination to DetailExerciseVC in Segue"); return}
        guard let indexPath = bodyPartTableView.indexPathForSelectedRow else {print("Error getting indexPath in Segue"); return}
        let exercise = exercises[indexPath.row]
        detailExerciseVC.exercise = exercise
    }

}



// MARK: CollectionView
extension BodyPartVC: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bodyparts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BodyPartCell.cellID, for: indexPath) as! BodyPartCell
        let bodypart = bodyparts[indexPath.item]
        cell.configureCell(bodyPart: bodypart)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationItem.title = bodyparts[indexPath.item].rawValue
        animateTable()
        let cell = collectionView.cellForItem(at: indexPath) as! BodyPartCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.green.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BodyPartCell
        cell.layer.borderWidth = 0.0
        cell.layer.borderColor = UIColor.clear.cgColor
    }

}


// MARK: Tableview
extension BodyPartVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.cellID, for: indexPath) as! ExerciseCell
        let exercise = exercises[indexPath.row]
        cell.configureCell(exercise: exercise)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Exercises: "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "TimesNewRomanPSMT", size: 16.0)
        header.textLabel?.textAlignment = .left
    }

}
