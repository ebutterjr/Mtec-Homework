//
//  ToDoListsTableViewController.swift
//  ToDoist
//
//  Created by Parker Rushton on 10/28/22.
//

import UIKit

class ToDoListsTableViewController: UITableViewController {
    
    private let manager = ItemManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ToDoist"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func list(at indexPath: IndexPath) -> ToDoList {
        manager.allLists()[indexPath.row]
    }
    
    @IBAction func presentNewListAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Create a new ToDoList", message: nil, preferredStyle: .alert)
        alert.addTextField { tf in
            tf.placeholder = "List name: Honey-Do, Chores, Projects, etc."
        }

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned alert] _ in
            guard let textField = alert.textFields?.first, let response = textField.text else { return }
            self.manager.createNewList(with: response)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    @IBSegueAction func showItems(_ coder: NSCoder) -> ItemsViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedList = list(at: indexPath)
        return ItemsViewController(code: coder, list: selectedList)
    }
    
}


// MARK: - Table view data source

extension ToDoListsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.allLists().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
        let listAtRow = list(at: indexPath)
        cell.textLabel?.text = listAtRow.title
        cell.detailTextLabel?.text = "\(listAtRow.itemsArray.count) items"
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        manager.deleteList(at: indexPath)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

}
