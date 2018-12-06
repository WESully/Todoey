//
//  ViewController.swift
//  Todoey
//
//  Created by William Sullivan on 12/4/18.
//  Copyright © 2018 WashCard Systems. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    //
    //
    //
    
    var itemArray = ["To Do 1", "To Do 2", "To Do 3"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        //
        //
        //
        
        print("override func viewDidLoad() ...")

        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib ...
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }
    
    //MARK: TableView Datasource Methods ...
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        //
        //
        
        print("override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ...")

        return(itemArray.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        //
        //
        
        print("override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ...")

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return(cell)
    }
    
    //MARK:  TableView Delegate Methods ...
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        //
        //
        
        print("override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) ...")
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addTouchUpInside(_ sender: UIBarButtonItem) {
        //
        //
        //
        
        var textField = UITextField()
        
        print("@IBAction func addTouchUpInside(_ sender: UIBarButtonItem) ...")
        
        let alertController = UIAlertController(title: "Title", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in

            print(textField.text as Any)
            
            //  Make sure textField is not empty ...
            // self.itemArray.append(textField.text ?? "N/A")
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")

            self.tableView.reloadData()
        }
        
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Item"
            
            textField = alertTextField
        }
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
