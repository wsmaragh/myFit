//
//  dHoldingCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class dHoldingCell: UITableViewCell {

    @IBOutlet weak var dCollectionView: UICollectionView!
    
    static let id = "dHoldingCell"
    
    internal weak var viewController: UIViewController?
    
    private var articles = [Article]() {
        didSet {
            self.dCollectionView.reloadData()
        }
    }
    
    internal func configureCell(forCell cell: dHoldingCell) {
        ArticlesAPIService.shared.getFitnessArticles { (onlineFitnessArticles) in
            self.articles = onlineFitnessArticles
        }
        self.configureCollectionView(cell: cell)
    }
    
    private func configureCollectionView(cell: dHoldingCell){
        cell.dCollectionView.dataSource = self
        cell.dCollectionView.delegate = self
        let layout = cell.dCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: cellSpacing, bottom: 0.0, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 2.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: cell.dCollectionView.bounds.height)
    }
    
}


extension dHoldingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.id, for: indexPath) as! ArticleCell
        let article = articles[indexPath.item]
        cell.configureCell(article: article)
        cell.layer.cornerRadius = 4
        return cell
    }
    
}

