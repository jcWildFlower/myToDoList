//
//  ViewController.swift
//  myToDoList
//
//  Created by Jongchan Son on 6/8/19.
//  Copyright © 2019 Jongchan Son. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find him", "EAt dinner later", "Teach her at 4:30"]
    
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
    


}

