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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
