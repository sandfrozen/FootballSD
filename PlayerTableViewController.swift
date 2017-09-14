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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "PlayerInfo":
            
            guard let destinationNavigationController = segue.destination as? UINavigationController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let playerViewController = destinationNavigationController.topViewController as? PlayerViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPlayerCell = sender as? PlayerTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPlayerCell) else {
                fatalError("The selected cell is not begin displayed by the table:")
            }
            let selectedPlayer = players[indexPath.row]
            playerViewController.player = selectedPlayer
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            break
        }
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
