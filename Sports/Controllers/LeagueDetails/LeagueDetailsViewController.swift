//
//  LeagueDetailsViewController.swift
//  Sports
//
//  Created by Ammar.M on 7/3/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class LeagueDetailsViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var nameLeagueLabel: UILabel!
    @IBOutlet weak var sportsLeagueLabel: UILabel!
    @IBOutlet weak var countryLeagueLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var presenter: LeaguesDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchLeaguesDetailsFromAPI()
    }
}

extension LeagueDetailsViewController: LeaguesDetailsView {
    func display(image: String ) {
        self.leagueImageView.showImage(image)
    }
    
    func display(name: String) {
        self.nameLeagueLabel.text = name
    }
    
    func display(sports: String) {
        self.sportsLeagueLabel.text = sports
    }
    
    func display(country: String) {
        self.countryLeagueLabel.text = country
    }
    
    func display(description : String) {
        self.descLabel.text = description
    }
    
    func displayNavigationBarTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func startLoadData() {
        self.startAnimating()
    }
    
    func stopLoadData() {
        self.stopAnimating()
    }
    
}
