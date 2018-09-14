//
//  RecipeCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/12/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!

    static let id = "RecipeCell"

    func configureCell(recipe: Recipe){
        recipeImageView.loadImage(imageURLString: recipe.image)
        recipeImageView.layer.cornerRadius = 8
        recipeImageView.layer.masksToBounds = true
        
        titleLabel.text = recipe.label
        if let diet = recipe.dietLabels[0] {
            typeLabel.text = diet
        }
        
//        servingsLabel.text = "# of Servings: \(recipe.yield)"
        caloriesLabel.text = "\( Int(recipe.calories) / recipe.yield ) cal."
    }
    
    
}
