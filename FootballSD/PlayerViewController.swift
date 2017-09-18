//
//  PlayerViewController.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 14.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    var player: Player? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var shirtLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var pointsAvgLabel: UILabel!
    @IBOutlet weak var myPointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = (player?.name)!
        avatarImageView.image = player?.photo
        ageLabel.text = String(describing: player!.age)
        birthLabel.text = player?.birth
        countryLabel.text = player?.country
        heightLabel.text = player?.height.description
        weightLabel.text = player?.weight.description
        shirtLabel.text = player?.shirtNumber.description
        positionLabel.text = player?.lineupDesc
        pointsAvgLabel.text = player?.pointsAvg.description
        myPointsLabel.text = player?.myPoints.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
