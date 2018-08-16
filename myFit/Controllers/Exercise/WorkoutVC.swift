
//
//  WorkoutVC.swift
//  Fit
//
//  Created by C4Q on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class WorkoutVC: UIViewController {

	@IBOutlet weak var suggestedWorkoutsCV: UICollectionView!
	@IBOutlet weak var myWorkoutsCV: UICollectionView!

    var viewModel: WorkoutViewModel!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupDelegatesDatasource()
	}

	override func viewWillAppear(_ animated: Bool) {

	}

	func setupDelegatesDatasource(){
		suggestedWorkoutsCV.delegate = self
		suggestedWorkoutsCV.dataSource = self
		myWorkoutsCV.delegate = self
		myWorkoutsCV.dataSource = self
	}

}



// MARK: CollectionView Datasource
extension WorkoutVC: UICollectionViewDataSource {
	
    func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
        switch collectionView {
		
            case self.suggestedWorkoutsCV:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sWorkout", for: indexPath) as! WorkoutCVC
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
extension WorkoutVC: UICollectionViewDelegateFlowLayout {
    
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
extension WorkoutVC: UICollectionViewDelegate {
	//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	//		let selectedPost = posts.reversed()[indexPath.row]
	//		let postDetailViewController = PostDetailViewController(post: selectedPost)
	//		self.navigationController?.pushViewController(postDetailViewController, animated: true)
	//	}
}


