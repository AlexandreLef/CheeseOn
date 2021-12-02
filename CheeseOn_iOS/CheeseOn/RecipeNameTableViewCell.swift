//
//  RecipeNameTableViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//

import UIKit

class RecipeNameTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeName: UILabel!
    
    var name: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let name = self.name {
            self.recipeName?.text = name
        }
    }

    func configure(_ name: String) {
        self.name = name
        self.recipeName?.text = name
    }

}

