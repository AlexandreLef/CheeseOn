//
//  RecipeSubtitleTableViewCell.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 01/12/2021.
//

import UIKit

class RecipeSubtitleTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ subtitle: String) {
        self.subtitleLabel.text = subtitle
    }

}
