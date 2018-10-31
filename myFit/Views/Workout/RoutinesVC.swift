
//
//  WorkoutVC.swift
//  Fit
//
//  Created by C4Q on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class RoutinesVC: UIViewController {
    
    @IBOutlet weak var numberOfExerciseLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    
    var workoutRoutine: Routine!
    
    private var exercises = [Exercise]() {
        didSet {
            numberOfExerciseLabel.text = "\(exercises.count)"
            animateTable()
        }
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        setupTableView()
        loadExercises()
        startButton.layer.cornerRadius = startButton.bounds.width / 2
	}
    
    deinit {

    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadExercises() {
        self.exercises = DatabaseJSON.absExercises
    }
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailExerciseVC = segue.destination as? ExerciseDetailVC else {print("Error downcasting destination to DetailExerciseVC in Segue"); return}
        guard let indexPath = tableView.indexPathForSelectedRow else {print("Error getting indexPath in Segue"); return}
        let exercise = exercises[indexPath.row]
        detailExerciseVC.exercise = exercise
    }

}



// MARK: Tableview
extension RoutinesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoutineExerciseCell.cellID, for: indexPath) as! RoutineExerciseCell
        let exercise = exercises[indexPath.row]
        cell.configureCell(exercise: exercise, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Routine: "
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
