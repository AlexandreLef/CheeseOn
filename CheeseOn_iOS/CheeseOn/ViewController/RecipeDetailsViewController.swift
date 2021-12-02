//
//  RecipeDetailsViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import UIKit

class RecipeDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipe: Recipe?
    var style = Style()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        back.tintColor = style.purple
        

        if recipe != nil {
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        }// if recipe ≠ null take image,name and times from recipe
    }
    
    func configure(recipe: Recipe) {
        self.recipe = recipe
        DispatchQueue.main.async {
            self.recipeTableView?.reloadData()
        }
    }
    
    @IBAction func backAction(){
        navigationController?.popViewController(animated: true)
    } // Back button
    

    //MARK: -- UITAbleViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        //Image, Name, Time, Title Ingredients, Ingredients, Title Step, Steps
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // Image
            return 1
        case 1: // Name
            return 1
        case 2: // Temps
            return 1
        case 3: // Titre Ingrédients
            return 1
        case 4: // Ingrédients
            return recipe?.ingredients.count ?? 0
        case 5: // Titre Etapes
            return 1
        case 6: // Etapes
            return recipe?.recipe.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: // Image
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeImageCell", for: indexPath) as! RecipeImageTableViewCell // use model cell
            if let image = recipe?.image {
                cell.configure(image)
            }
            return cell// send cell
        
        case 1: // Name
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeNameCell", for: indexPath) as! RecipeNameTableViewCell
            if let name = recipe?.name {
                cell.configure(name)
            }
            return cell
        
        case 2: // Time
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeTimingCell", for: indexPath) as! RecipeTimingTableViewCell
            if let cooking = recipe?.cooking, let preparation = recipe?.preparation {
                cell.configure(preparation: preparation, cooking: cooking)
            }
            return cell
        
        case 3: // Title Ingredient
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeSubtitleCell", for: indexPath) as! RecipeSubtitleTableViewCell
            cell.configure("Ingrédients :")
            return cell
        
        case 4: // Ingredients
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeIngredientTableViewCell", for: indexPath) as! RecipeIngredientTableViewCell
            let ingredient = recipe?.ingredients[indexPath.row] // take ingredient by th row of tab
            cell.configure(ingredient)// send to the cell the ingredient selected
            return cell
        
        case 5: // Title step
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeSubtitleCell", for: indexPath) as! RecipeSubtitleTableViewCell
            cell.configure("Recette :")
            return cell
        
        case 6: // Step
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeIngredientTableViewCell", for: indexPath) as! RecipeIngredientTableViewCell
            let ingredient = recipe?.recipe[indexPath.row] // take recipes step by th row of tab
            cell.configure(ingredient)// send to the cell the step selected
            return cell
        
        default:
            return UITableViewCell()
        }
    }

}
