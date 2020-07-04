//
//  HomeLeagueViewController.swift
//  Sports
//
//  Created by Ammar.M on 7/2/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class HomeLeagueViewController: UIViewController {
    
    @IBOutlet weak var leaguesTableView: UITableView!
    
    var presenter: HomeLeaguePresenter!
    let leagueCell = "leagueCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Leagues"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        presenter = HomeLeagueImplementation(view : self)
        leaguesTableView.register(UINib(nibName: "HomeLeagueTableCell", bundle: nil), forCellReuseIdentifier: leagueCell)
        presenter.fetchLeaguesFromAPI()
    }
}

// MARK: - UITableViewDataSource

extension HomeLeagueViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfLeague
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell") as! HomeLeagueTableCell
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! HomeLeagueTableCell
        presenter.configure(cell: cell, forRow: indexPath.row)
    }
}

// MARK: - UITableViewDelegate

extension HomeLeagueViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelectRowAt(index: indexPath.row)
    }
}

extension HomeLeagueViewController: HomeLeagueView {
    
    func reloadTableViewData() {
        self.leaguesTableView.reloadData()
    }
    
    func navigateToLeaugesDetails(id: String) {
        let vc = LeagueDetailsViewController()
        vc.presenter = LeagueDetailsImplementation(view: vc)
        vc.presenter.leagueId = id
        self.navigationController!.pushViewController(vc, animated: true)
    }
}

