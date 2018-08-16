//
//  BodyPartVC.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class BodyPartVC: UIViewController {

    private var bodyPart: BodyParts = BodyParts.Chest {
        didSet {
            self.loadExercises()
        }
    }
    private var exercises = [Exercise]()
    
    @IBOutlet weak var exercisesTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDelegatesAndDatasource()
    }
    
    private func setupTableViewDelegatesAndDatasource() {
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
    }
    
    
    private func loadExercises(){
        //fetch exercises for bodypart
        //self.exercises = fetchedExercises
    }





    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "QuestionSegue",
//            let detailVC = segue.destination as? QuestionDetailViewController,
//            let indexPath = tableView.indexPathForSelectedRow {
//            let question = filteredQuestions[indexPath.row]
//            detailVC.question = question
//        }
    }

}


// MARK: Tableview Datasource
extension BodyPartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
        
        return cell
    }
}


// MARK: Tableview Delegate
extension BodyPartVC: UITableViewDelegate {
    
}
