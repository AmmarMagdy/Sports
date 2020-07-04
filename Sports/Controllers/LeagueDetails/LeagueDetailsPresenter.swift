//
//  LeagueDetailsPresenter.swift
//  Sports
//
//  Created by Ammar.M on 7/3/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation

protocol LeaguesDetailsView: class {
    func display(image: String)
    func display(name: String)
    func display(sports: String)
    func display(country: String)
    func display(description: String)
    func startLoadData()
    func stopLoadData()
    func displayNavigationBarTitle(title: String)
}

protocol LeaguesDetailsPresenter {
    var leagueId: String! { get set }
    func fetchLeaguesDetailsFromAPI()
    func viewDidLoad()
}

class LeagueDetailsImplementation: LeaguesDetailsPresenter {
    
    var leagueId: String!
    weak var view : LeaguesDetailsView?
    var leagueDetails: LeagueDetails!
    
    init(view : LeaguesDetailsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayNavigationBarTitle(title: leagueDetails.strLeague ?? "")
        view?.display(name: leagueDetails.strLeague ?? "")
        view?.display(image: leagueDetails.strLogo ?? "")
        view?.display(sports: leagueDetails.strSport ?? "")
        view?.display(country: leagueDetails.strCountry ?? "")
        view?.display(description: leagueDetails.strDescriptionEN ?? "")
    }
    
    func fetchLeaguesDetailsFromAPI() {
        view?.startLoadData()
        Request.requestAPI(router: Router.getLeaguesDetails(id: leagueId)) { [unowned self](response, _) in
            self.view?.stopLoadData()
            switch response {
            case .success(let result):
                do {
                    let leagueDet = try JSONDecoder().decode(LeaguesDetails.self, from: result)
                    if let league = leagueDet.leagues {
                        if league.count > 0 {
                            self.leagueDetails = league[0]
                            self.viewDidLoad()
                        }
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
