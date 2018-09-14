//
//  ArticleCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    static let id = "ArticleCell"
    
    func configureCell(article: Article){
        articleTitleLabel.text = article.title
        
        if let decodedHtmlString = article.description?.htmlAttributedString {
            descriptionLabel.attributedText = decodedHtmlString
        } else {
            descriptionLabel.text = "No Description"
        }

        guard let imageStr = article.urlToImage else {return}
        articleImageView.loadImage(imageURLString: imageStr)
        
//        spinner.startAnimating()
//        spinner.isHidden = false
//        DispatchQueue.global().async { [weak self] in
//            guard let url = URL(string: imageStr) else {return}
//            guard let data = try? Data(contentsOf: url) else {return}
//            guard let image = UIImage(data: data) else {return}
//            DispatchQueue.main.async {
//                self?.articleImageView.image = nil
//                self?.articleImageView.image = image
//                self?.spinner.stopAnimating()
//                self?.spinner.isHidden = true
//            }
//        }
        
        
    }

}
