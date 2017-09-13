//
//  TeamTableViewController.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {

    var teams = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleTeams()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTableViewCell", for: indexPath) as? TeamTableViewCell else {
            fatalError("The dequeued cell is not an instance of TeamTableViewCell.")
        }
        
        let team = teams[indexPath.row]
        
        cell.nameLabel.text = team.name
        cell.logoImageView.image = team.logo
        cell.startsAtLabel.text = team.startsAt

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Private Methods
    private func loadSampleTeams() {
        let logo1 = UIImage(named: "logo1")
        
        guard let team1 = Team(id: 1, name: "Jaga", logo: logo1, startsAt: "2017-09-11T18:00:00.000+02:00") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let team2 = Team(id: 2, name: "Legia", logo: logo1, startsAt: "2017-09-11T18:00:00.000+02:00") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let team3 = Team(id: 3, name: "Wisła", logo: logo1, startsAt: "2017-09-11T18:00:00.000+02:00") else {
            fatalError("Unable to instantiate meal1")
        }
        
        teams += [team1, team2, team3]
    }
}
