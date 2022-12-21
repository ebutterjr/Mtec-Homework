//
//  RepresentitiveTableViewController.swift
//  Api Project
//
//  Created by Easton Butterfield on 12/8/22.
//

import UIKit

class RepresentitiveTableViewController: UITableViewController, UISearchBarDelegate {
    enum RepItemError: Error, LocalizedError {
        case DataMissing
    }
    struct Results: Codable {
        var results: [Representative]
    }
    struct Representative: Codable {
        let name: String
        let state: String
        let district: String
        let phone: String
        let office: String
        let link: String
    }
    var reps:  [Representative]?
    
    @IBOutlet weak var repSearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        repSearchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let reps = reps else {return 0}
        return reps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reps = reps else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "rep", for: indexPath) as! RepresentitiveTableViewCell
        let representitive = reps[indexPath.row]
        cell.update(with: representitive)
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text?.count == 5, let searchString = searchBar.text else {return}
        guard let url = URL(string: "https://whoismyrepresentative.com/getall_mems.php?zip=\(searchString)&output=json") else {return}
        Task {
            let reps = try await fetchRepResponse(url: url)
            print("rep: ", reps[0])
            self.reps = reps
            tableView.reloadData()
            }
        
    }
    func fetchRepResponse(url: URL) async throws -> [Representative] {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RepItemError.DataMissing
        }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Results.self, from: data)
        return  decodedData.results
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
