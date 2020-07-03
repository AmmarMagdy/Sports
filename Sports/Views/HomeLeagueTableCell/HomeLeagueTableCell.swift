//
//  HomeLeagueTableCell.swift
//  Sports
//
//  Created by Ammar.M on 7/2/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class HomeLeagueTableCell: UITableViewCell {
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var categoryLeagueLabel: UILabel!
    @IBOutlet weak var leagueAlternateLabel: UILabel!
    
    func display(name: String) {
        leagueNameLabel.text = name
    }
    
    func display(category: String) {
        categoryLeagueLabel.text =  category
    }
    
    func display(leagueAlternate: String) {
        leagueAlternateLabel.text = leagueAlternate
    }
    
}
