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
    
    let itemArray = ["To Do 1", "To Do 2", "To Do 3"]

    override func viewDidLoad() {
        //
        //
        //
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib ...
    }
    
    //MARK: TableView Datasource Methods ...
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        //
        //
        
        return(itemArray.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        //
        //
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return(cell)
    }
    
    //MARK:  TableView Delegate Methods ...
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        //
        //
        
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
