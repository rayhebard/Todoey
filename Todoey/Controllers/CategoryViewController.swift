//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Raymond Hebard on 7/19/19.
//  Copyright © 2019 Raymond Hebard. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    //Initializat Realm
    let realm = try! Realm()
    
    //Collection of Results that are category objects
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load all Categories
        loadCategories()

    }

    // MARK: - Table view data source
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
    
        // Upon selecting the add button an alert it created
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            // Create a category to be added to DB
            let newCategory = Category()
            newCategory.name = textField.text!

            self.save(category: newCategory)
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of categories returned as rows ?? defaults to 1
        return categories?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        //If we have no categories we use a default value
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    
    
    func loadCategories(){
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory =  categories?[indexPath.row]
        }
    }
    
    func save(category: Category){
        
        do{
            // Have realm add/create a category
            try realm.write{
                realm.add(category)
            }
        }catch{
            print("Error trying to save category reason: \(error)")
        }
        tableView.reloadData()
        
    }
    
    
    

}
