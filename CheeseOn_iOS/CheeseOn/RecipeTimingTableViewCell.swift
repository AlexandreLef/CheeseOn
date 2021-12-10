//
//  RecipeTimingTableViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//

import UIKit

class RecipeTimingTableViewCell: UITableViewCell {
    
    var style = Style()

    @IBOutlet weak var preparationTime: UILabel!
    @IBOutlet weak var cookingTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(preparation: Int, cooking: Int) {
        self.preparationTime?.text = " \(preparation) min"  //change le text du label avec le .text
        self.cookingTime?.text = " \(cooking) min"
        preparationTime.font = style.corp
        cookingTime.font = style.corp
    }

}

