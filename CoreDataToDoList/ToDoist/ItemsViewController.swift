//
//  ViewController.swift
//  ToDoist
//
//  Created by Parker Rushton on 10/15/22.
//

import UIKit

class ItemsViewController: UIViewController {

    enum TableSection: Int {
        case incomplete, complete
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    
    let list: ToDoList

    private let itemManager = ItemManager.shared
    private lazy var datasource: ItemDataSource = {
        let datasource = ItemDataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifier) as! ItemTableViewCell
            cell.update(with: item)
            cell.delegate = self
            return cell
        }
        datasource.delegate = self
        return datasource
    }()


    
    // MARK: - Lifecycle
    

    init?(code aDecoder: NSCoder, list: ToDoList) {
        self.list = list
        super.init(coder: aDecoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("I WILL NEVER instantiate through storyboard! It's impossible to initialize super.init?(coder aDecoder: NSCoder) with any other parameter")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = datasource
        navigationItem.largeTitleDisplayMode = .never
        generateNewSnapshot()
    }

}


// MARK: - Item Cell Delegate

extension ItemsViewController: ItemCellDelegate {

    func completeButtonPressed(item: Item) {
        itemManager.toggleItemCompletion(item)
        generateNewSnapshot()
    }
    
}


// MARK: - ItemDelegate

extension ItemsViewController: ItemDelegate {
    
    func deleteItem(at indexPath: IndexPath) {
        let itemToDelete = item(at: indexPath)
        itemManager.delete(itemToDelete)
        generateNewSnapshot()
    }
    
    func item(at indexPath: IndexPath) -> Item {
        let section = TableSection(rawValue: indexPath.section)!
        switch section {
        case .incomplete:
            return itemManager.incompleteItems(of: list)[indexPath.row]
        case .complete:
            return itemManager.completedItems(of: list)[indexPath.row]
        }
    }
    
}


// MARK: - TextField Delegate

extension ItemsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else { return true }
        itemManager.createNewItem(with: text, list: list)
        textField.text = ""
        generateNewSnapshot()
        return true
    }
    
}


// MARK: - Private

private extension ItemsViewController {
    
    func generateNewSnapshot() {
        // Create a snapshot
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Item>()
        // Fetch incomplete and completed items from Core Data
        let incompleteItems = itemManager.incompleteItems(of: list)
        let completedItems = itemManager.completedItems(of: list)
        
        // If there are incomplete items to show, add them to the tableview
        if !incompleteItems.isEmpty {
            snapshot.appendSections([.incomplete])
            snapshot.appendItems(incompleteItems, toSection: .incomplete)
        }
        // If there are completed items to show, add them to the tableview
        if !completedItems.isEmpty {
            snapshot.appendSections([.complete])
            snapshot.appendItems(completedItems, toSection: .complete)
        }
        // Apply the snapshot
        DispatchQueue.main.async {
            self.datasource.apply(snapshot)
        }
    }
    
}
