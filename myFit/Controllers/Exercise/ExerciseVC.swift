
//
//  WorkoutVC.swift
//  Fit
//
//  Created by C4Q on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import RealmSwift


class ExerciseVC: UIViewController {

    @IBOutlet weak var myWorkoutsCV: UICollectionView!
    @IBOutlet weak var suggestedWorkoutsCV: UICollectionView!
    
    
    var viewModel: ExerciseViewModel!

    var sections: [String] = ["My Workouts", "Suggested Workouts"]
    var myWorkouts : Results<Workout>!
    var suggestedWorkouts : Results<Workout>!
    
    
//    var myWorkouts = [Workout]() {
//        didSet{
//            myWorkoutsCV.reloadData()
//        }
//    }
//    var suggestedWorkouts = [Workout]() {
//        didSet{
//          suggestedWorkoutsCV.reloadData()
//        }
//    }
    
    
    var myWorkoutsRealmNotificationToken: NotificationToken?
    var suggestedWorkoutsRealmNotificationToken: NotificationToken?

    let workoutCell = "WorkoutCell"
//    let suggestedWorkoutCell = "SuggestedWorkoutCell"

    let sectionHeaderView = "SectionHeaderView"
    
    
	override func viewDidLoad() {
		super.viewDidLoad()
		setupDelegatesDatasource()
        setupRealm()

	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopObservingRealm()
    }
    

	func setupDelegatesDatasource(){
        myWorkoutsCV.delegate = self
        myWorkoutsCV.dataSource = self
//        suggestedWorkoutsCV.delegate = self
//        suggestedWorkoutsCV.dataSource = self
        
	}
    
    private func setupRealm(){
        let realm = RealmService.shared.realm
        myWorkouts = RealmService.shared.read(PickUpLine.self) //Read from Realm
        
        //observe realm for change
        //        myWorkoutsRealmNotificationToken = realm.observe { (notification, localRealm) in
        //            if notification.rawValue == "RLMRealmDidChangeNotification" {
        //                self.tableView.reloadData()
        //            }
        //        }
        
        // Set pickupLines notification block
        self.myWorkoutsRealmNotificationToken = myWorkouts.observe({ (changes: RealmCollectionChange) in
            switch changes {
                
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self.myWorkoutsCV.reloadData()
                break
                
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
//                self.myWorkoutsCV.beginUpdates()
//                self.myWorkoutsCV.performBatchUpdates(<#T##updates: (() -> Void)?##(() -> Void)?##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
                self.myWorkoutsCV.insertItems(at: insertions.map { IndexPath(item: $0, section: 0) })
                self.myWorkoutsCV.deleteItems(at: deletions.map { IndexPath(item: $0, section: 0) })
                self.myWorkoutsCV.reloadItems(at: modifications.map { IndexPath(item: $0, section: 0)} )
                break
                
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
                break
            }
        })
    }
    
    private func stopObservingRealm(){
        myWorkoutsRealmNotificationToken?.invalidate()
//        suggestedWorkoutsRealmNotificationToken?.invalidate()
    }

    
    @IBAction func AddWorkoutTapped() {
    
        //create workout
        let exercise1 = Exercise(name: "Chest Press", desc: "Works the chest", instructions: "Start with arms slightly wider than shoulder width. Extend arms to unti l almost locked out, then return. Repeat 10-15x", imageStr: nil)
        let exercise2 = Exercise(name: "Chest Press", desc: "Works the chest", instructions: "Start with arms slightly wider than shoulder width. Extend arms to unti l almost locked out, then return. Repeat 10-15x", imageStr: nil)
        let exercises: [Exercise] = [exercise1, exercise2]        
        let workout = Workout(name: "Chest", exercises: exercises, duration: 90)
        
        //add Workout
        RealmService.shared.create(workout)
    }
    
}



// MARK: CollectionView Datasource
extension ExerciseVC: UICollectionViewDataSource {
	
    func numberOfSections(in collectionView: UICollectionView) -> Int {
		return sections.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
        switch collectionView {
		
            case self.suggestedWorkoutsCV:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sWorkout", for: indexPath) as! WorkoutCell
                cell.backgroundColor = .orange
    //			let fave = faves[indexPath.row]
    //			cell.imgView.image = fave
                return cell
            
            case self.myWorkoutsCV:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mWorkout", for: indexPath)
    //			let post = posts.reversed()[indexPath.row]
                cell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    //			cell.imgView.kf.setImage(with: URL(string: post.postImageStr!))
                return cell
            
            default:
                return UICollectionViewCell()
		}
	}
	
}


// MARK: CollectionView FlowLayout
extension ExerciseVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 15.0
        layout.minimumInteritemSpacing = 5.0
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth: CGFloat = (collectionView.bounds.width / 2) - 20.0
        let itemHeight: CGFloat = collectionView.bounds.height / 4.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
}


// MARK: CollectionView Delegate
extension ExerciseVC: UICollectionViewDelegate {
	//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	//		let selectedPost = posts.reversed()[indexPath.row]
	//		let postDetailViewController = PostDetailViewController(post: selectedPost)
	//		self.navigationController?.pushViewController(postDetailViewController, animated: true)
	//	}
}


