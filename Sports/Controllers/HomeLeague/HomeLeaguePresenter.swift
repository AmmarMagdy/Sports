//
//  HomeLeaguePresenter.swift
//  Sports
//
//  Created by Ammar.M on 7/2/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation

protocol HomeLeaguePresenter {
    var numberOfLeague: Int { get }
    func configure(cell: HomeLeagueTableCell, forRow row: Int)
    func fetchLeaguesFromAPI()
}

class HomeLeagueImplementation: HomeLeaguePresenter {
    
    weak var view : HomeLeagueViewController?
    var leagues = [Leagues]()
    
    var numberOfLeague: Int {
        return leagues.count
    }
    
    init(view : HomeLeagueViewController) {
        self.view = view
    }
    
    func configure(cell: HomeLeagueTableCell, forRow row: Int) {
        let league = self.leagues[row]
        
        cell.display(name: league.strLeague ?? "")
        cell.display(category: league.strSport ?? "")
        cell.display(leagueAlternate: league.strLeagueAlternate ?? "")
    }
    
    func fetchLeaguesFromAPI() {
        Request.requestAPI(router: Router.getLeagues) { [unowned self](response, _) in
            switch response {
            case .success(let result):
                do {
                    let league = try JSONDecoder().decode(League.self, from: result)
                    if let _ = league.leagues {
                        self.leagues = league.leagues!
                        self.view?.leaguesTableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                Alert.shared.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
}
