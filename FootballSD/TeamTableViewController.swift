//
//  TeamTableViewController.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit

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
        cell.startsAtLabel.text = "Starts at: " + team.startsAt

        return cell
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
        startLoadingAnimation()
        
        SpaceDigitalAPI.getTeams() {
            teamsArr in
            // For each team-array in teamsArr create the team object and add to teams list
            for team in teamsArr {
                if let newTeam = Team(teamInArray: team) {
                    self.teams.append(newTeam)
                }
            }
        }
        
        stopLoadingAnimation()
    }
    
    private func startLoadingAnimation() {
        activityIndicatior.center = self.view.center
        activityIndicatior.hidesWhenStopped = true
        activityIndicatior.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicatior)
        activityIndicatior.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    private func stopLoadingAnimation() {
        activityIndicatior.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}





















