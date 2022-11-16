//
//  AthletesTableViewController.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/3/22.
//

import UIKit

class AthletesTableViewController: UITableViewController, Stepperable, AddAthleteViewControllerDelegate {
    var isSorting: Bool = true
    var game: Game?
    var noGame: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func sortByHighestPressed(_ sender: Any) {
        guard let game = game else {return}
        isSorting = true
        self.game?.athletes = game.athletes.sorted(by: {$0.score > $1.score})
        tableView.reloadData()
    }
    @IBAction func sortByLowestPressed(_ sender: Any) {
        guard let game = game else {return}
        isSorting = false
        self.game?.athletes = game.athletes.sorted(by: {$0.score < $1.score})
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let game = game else {return 0}
        return game.athletes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let game = game else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "athletes", for: indexPath) as! AthletesTableViewCell
        let athlete = game.athletes[indexPath.row]
        cell.update(with: athlete)
        cell.showsReorderControl = true
        cell.delegate = self
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        guard let game = game else {return}
        self.game?.athletes = game.athletes.sorted(by: {$0.score > $1.score})
        tableView.reloadData()
    }
    func stepperSortValue(athlete: Athlete) {
        guard var game = game, let indexAthlete = game.athletes.firstIndex(where: {$0.name == athlete.name}) else { return }
        self.game?.athletes[indexAthlete].score = athlete.score
        game.athletes[indexAthlete].score = athlete.score
        if isSorting == true {
            self.game?.athletes = game.athletes.sorted(by: {$0.score > $1.score})
        } else if isSorting == false {
            self.game?.athletes = game.athletes.sorted(by: {$0.score < $1.score})
        }
        tableView.reloadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "AddAthlete", let vc = segue.destination as? AddAthleteViewController else {return}
        vc.delegate = self
    }
    func didAddAthlete(athlete: Athlete) {
        game?.athletes.append(athlete)
       let index = Game.games.firstIndex { aGame in
            aGame.title == game?.title
        }
        guard let game = game,
        let index = index else {return}
        Game.games[index] = game
        tableView.reloadData()
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
