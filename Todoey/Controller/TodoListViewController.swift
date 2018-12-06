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
    
    var itemArray = /*["To Do 1", "To Do 2", "To Do 3"]*/ [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        //
        //
        //
        
        print("override func viewDidLoad() ...")

        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib ...
        
        let newItem1 = Item()
        newItem1.title = "To Do 1"
        
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "To Do 2"
        
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "To Do 3"
        
        itemArray.append(newItem3)

        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
        
        // defaults.set(0.24, forKey: "Volume")
        // defaults.set(true, forKey: "MusicOn")
        // defaults.set("Sully", forKey: "PlayerName")
        // defaults.set(Date(), forKey: "AppLastOpenedByUser")
        
        // let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
        // let myArray = defaults.array(forKey: "TheArray") as! [Int]
        // let myDictionary = defaults.dictionary(forKey: "TheDictionary")
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
        
        let item = itemArray[indexPath.row]
        
        // cell.textLabel?.text = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none

        // if item.done == true {
        //     cell.accessoryType = .checkmark
        // }
        // else {
        //     cell.accessoryType = .none
        // }

        return(cell)
    }
    
    //MARK:  TableView Delegate Methods ...
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        //
        //
        
        print("override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) ...")
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        //     tableView.cellForRow(at: indexPath)?.accessoryType = .none
        // }
        // else {
        //     tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        // }
        
        tableView.reloadData()
        
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
            // self.itemArray.append(textField.text!)
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)

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
