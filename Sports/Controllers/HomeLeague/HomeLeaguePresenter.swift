//
//  HomeLeaguePresenter.swift
//  Sports
//
//  Created by Ammar.M on 7/2/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation

protocol HomeLeagueView : AnyObject {
    func reloadTableViewData()
    func navigateToLeaugesDetails(id: String)
}

protocol HomeLeaguePresenter {
    var numberOfLeague: Int { get }
    func configure(cell: HomeLeagueTableCell, forRow row: Int)
    func fetchLeaguesFromAPI()
    func didSelectRowAt(index: Int)
}

class HomeLeagueImplementation: HomeLeaguePresenter {
    
    weak var view : HomeLeagueView?
    var leagues = [Leagues]()
    
    var numberOfLeague: Int {
        return leagues.count
    }
    
    init(view : HomeLeagueView) {
        self.view = view
    }
    
    func configure(cell: HomeLeagueTableCell, forRow row: Int) {
        let league = self.leagues[row]
        cell.display(name: league.strLeague ?? "")
        cell.display(category: league.strSport ?? "")
        cell.display(leagueAlternate: league.strLeagueAlternate ?? "")
    }
    
    func didSelectRowAt(index: Int) {
        guard let leagueID = self.leagues[index].idLeague else { return }
        view?.navigateToLeaugesDetails(id: leagueID)
    }
    
    func fetchLeaguesFromAPI() {
        Request.requestAPI(router: Router.getLeagues) { [unowned self](response, _) in
            switch response {
            case .success(let result):
                do {
                    let league = try JSONDecoder().decode(League.self, from: result)
                    if let _ = league.leagues {
                        self.leagues = league.leagues!
                        self.view?.reloadTableViewData()
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


