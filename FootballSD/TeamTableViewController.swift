//
//  TeamTableViewController.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit
import os.log

class TeamTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var teams = [Team]()
    var activityIndicatior: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTeams()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "TabBar":
            //os_log("Going to TabBar.", log: OSLog.default, type: .debug)
            guard let tabBarController = segue.destination as? TabBarController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
//            guard let fieldViewController = tabBarController.viewControllers?[0].childViewControllers[0] as? FieldViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
            guard let playerTableViewController = tabBarController.viewControllers?[1].childViewControllers[0] as? PlayerTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedTeamCell = sender as? TeamTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTeamCell) else {
                fatalError("The selected cell is not begin displayed by the table:")
            }
            let selectedTeam = teams[indexPath.row]
            playerTableViewController.team = selectedTeam
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            break
        }
    }
    
    //MARK: - Actions
    
    @IBAction func refresh(_ sender: Any) {
        // First clear actual list of teams
        teams = [Team]()
        
        // Load teams from server
        loadTeams()
        
        // Reload Table Viee
        tableView.reloadData()
    }
    
    //MARK: - Private Methods
    
    private func loadTeams() {
        startLoadingAnimation(activityIndicatior)
        
        let teamsArray = SpaceDigitalAPI.getTeams()
        for team in teamsArray {
            if let newTeam = Team(teamInArray: team) {
                self.teams.append(newTeam)
            }
        }
        
        stopLoadingAnimation(activityIndicatior)
    }
}


extension UIViewController {
    func startLoadingAnimation(_ indicator: UIActivityIndicatorView) {
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(indicator)
        indicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopLoadingAnimation(_ indicator: UIActivityIndicatorView) {
        indicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}


















