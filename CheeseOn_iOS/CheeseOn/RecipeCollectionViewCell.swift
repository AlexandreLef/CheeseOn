//
//  RecipeCollectionViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    var style = Style()

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    
    func border() {
        recipeImage.layer.masksToBounds = true
        recipeImage.contentMode = .scaleToFill
        recipeImage.layer.borderWidth = 4
        recipeImage.layer.borderColor = style.yellow.cgColor
        recipeImage.layer.cornerRadius = recipeImage.frame.size.height/4
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(imageName: String, recipeName: String) {
        recipeImage.image = UIImage(named: imageName)
        self.recipeName.text = recipeName
        border()

    }// link with the JSON
    
}
