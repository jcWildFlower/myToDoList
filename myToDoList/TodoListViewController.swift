//
//  ViewController.swift
//  myToDoList
//
//  Created by Jongchan Son on 6/8/19.
//  Copyright © 2019 Jongchan Son. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find him", "EAt dinner later", "Teach her at 4:30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Tableview Datasource Methods

    
    //tableView(_:numberOfRowsInSection:)
    //Tells the delegate to return the numOfCells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    //tableView:cellForRowAtIndexPath:
    //Asks the data source for a cell to insert in a particular location of the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //tableView(_:didSelectRowAt:)
    //Tells the delegate that the specified row is now selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK: - Add New Items
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        //This is called once the Add Item button pressed
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print(textField.text)
            self.itemArray.append(textField.text!)
            
            //Call the reloadData method when the data source has changed.
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        //Attach the acction to alert or actionSheet
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        tableView.reloadData()
    }
    

}

