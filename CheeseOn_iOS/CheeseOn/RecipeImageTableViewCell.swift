//
//  RecipeImageTableViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//

import UIKit

class RecipeImageTableViewCell: UITableViewCell {
    
    var style = Style()

    @IBOutlet weak var recipeImage: UIImageView!
    
    var imageName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let imageName = self.imageName {
            recipeImage?.image = UIImage(named: imageName)
        }
    }
    
    func configure(_ imageName: String) {
        self.imageName = imageName
        recipeImage?.image = UIImage(named: imageName)
        recipeImage.layer.masksToBounds = true
        recipeImage.layer.borderWidth = 7
        recipeImage.layer.borderColor = style.yellow.cgColor
        recipeImage.layer.cornerRadius = recipeImage.frame.size.height / 8
        recipeImage.backgroundColor = style.yellow
    }

}
