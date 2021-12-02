//
//  RecipeIngredientTableViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//


import UIKit

class RecipeIngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ ingredient: String?) {
        self.ingredientLabel?.text = ingredient
    }

}
