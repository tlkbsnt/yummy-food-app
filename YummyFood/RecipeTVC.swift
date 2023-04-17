//
//  RecipeTVC.swift
//  YummyFood
//
//  Created by Tilak Basnet on 3/8/23.
//

import UIKit

class RecipeTVC: UITableViewController {
    
    var hits = [Hits]()
    var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecipes()
      
    }
    
    func download(at url: String, handler: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            debugPrint("Failed to create URL")
            handler(nil)
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            handler(data)
        }
        task.resume()
    }
    
    func getRecipes() {
        let url = "https://api.edamam.com/api/recipes/v2?q=\(self.searchQuery)&app_id=4c4c90a9&app_key=f89311f8ba6a9fef279bc2b035d1eded&type=public"
        download(at: url) {
            (recipeData) in
            if let recipeData = recipeData {
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Response.self, from: recipeData)
                    self.hits = response.hits
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch {
                    debugPrint("Failed to parse data")
                }
            } else {
                debugPrint("Failed to get recipes")
            }
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        
        let data = try? Data.init(contentsOf: URL(string: hits[indexPath.row].recipe.image)!)
        cell.imageView?.image = UIImage.init(data: data!)
        cell.textLabel?.text = hits[indexPath.row].recipe.label
        cell.detailTextLabel?.text = String(hits[indexPath.row].recipe.yield)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail" {
            let recipeVC: RecipeVC = segue.destination as! RecipeVC
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            recipeVC.recipe = hits[indexPath!.row].recipe
        }
    }
    
}
