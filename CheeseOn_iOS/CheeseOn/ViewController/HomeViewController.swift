//
//  HomeViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 17/11/2021.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var style = Style()
    var recipes: [Recipe]!
    var allRecipes: [Recipe]!
    
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    @IBOutlet weak var categoryChoice: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryChoice.backgroundColor = style.purple
        
        self.loadRecipes()
        
        recipes = allRecipes
        
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
  }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    } // calc the number of cells in the tab
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recipeCollectionView.dequeueReusableCell(withReuseIdentifier: "recipeCollectionViewCell", for: indexPath) as! RecipeCollectionViewCell
        let ligneActuel = indexPath.row
        let recipeImage = recipes![ligneActuel].image
        let recipeName = recipes![ligneActuel].name

        cell.configure(imageName: recipeImage, recipeName: recipeName)
        return cell // make the link with RecipeCollectionViewCell
    }// loop to create the tab elements
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ligneActuel = indexPath.row
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let recipeDetailsViewController = storyboad.instantiateViewController(withIdentifier: "recipeDetailsViewController") as! RecipeDetailsViewController
        recipeDetailsViewController.configure(recipe: recipes![ligneActuel])
        self.navigationController?.pushViewController(recipeDetailsViewController, animated: true)
    }// changing collectionView -> redirect to details when we clicked on an image
    
    func loadRecipes() {
        if let path = Bundle.main.path(forResource: "RecipesList", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Recipe].self, from: data)
                self.allRecipes = jsonData
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    @IBAction func changeCategory() {
        if categoryChoice.selectedSegmentIndex == 0 {
            recipes = allRecipes.filter({$0.category == "Salée"}) // filter datas
            DispatchQueue.main.async {
                self.recipeCollectionView.reloadData()// reload the datasof the collection view
            }
        } else {
            recipes = allRecipes.filter({$0.category == "Sucrée"}) // filter datas
            DispatchQueue.main.async {
                self.recipeCollectionView.reloadData()// reload the datasof the collection view
            }
        }
    }
    

}
