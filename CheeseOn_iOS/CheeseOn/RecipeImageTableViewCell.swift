//
//  RecipeImageTableViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//

import UIKit

class RecipeImageTableViewCell: UITableViewCell {

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
    }

}
