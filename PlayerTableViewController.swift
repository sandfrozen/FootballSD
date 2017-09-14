//
//  PlayerTableViewController.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 14.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    
    var team: Team?
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = (team?.name)!
        loadPlayers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as? PlayerTableViewCell else {
            fatalError("The dequeued cell is not an instance of PlayerTableViewCell.")
        }
        
        let player = players[indexPath.row]
        
        cell.nameLabel.text = player.name
        cell.avatarImageView.image = player.photo
        cell.positionLabel.text = "Position: " + player.lineupDesc
        
        return cell
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refresh(_ sender: Any) {
        // First clear actual list of players
        players = [Player]()
        
        // Load teams from server
        loadPlayers()
        
        // Reload Table Viee
        tableView.reloadData()
    }
    
    func loadPlayers() {
        let id = (team?.id)!
        let playersArray = SpaceDigitalAPI.getPlayers(teamId: id)
        for player in playersArray {
            if let newPlayer = Player(playerInArray: player) {
                self.players.append(newPlayer)
            }
        }
    }
}
