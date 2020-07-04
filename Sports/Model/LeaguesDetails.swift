//
//  LeaguesDetails.swift
//  Sports
//
//  Created by Ammar.M on 7/3/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation

struct LeaguesDetails : Codable {
    
    let leagues: [LeagueDetails]?
}

struct LeagueDetails : Codable {
    
    let dateFirstEvent : String?
    let idAPIfootball : String?
    let idCup : String?
    let idLeague : String?
    let idSoccerXML : String?
    let intFormedYear : String?
    let strBadge : String?
    let strBanner : String?
    let strComplete : String?
    let strCountry : String?
    let strCurrentSeason : String?
    let strDescriptionCN : String?
    let strDescriptionDE : String?
    let strDescriptionEN : String?
    let strDescriptionES : String?
    let strDescriptionFR : String?
    let strDescriptionHU : String?
    let strDescriptionIL : String?
    let strDescriptionIT : String?
    let strDescriptionJP : String?
    let strDescriptionNL : String?
    let strDescriptionNO : String?
    let strDescriptionPL : String?
    let strDescriptionPT : String?
    let strDescriptionRU : String?
    let strDescriptionSE : String?
    let strDivision : String?
    let strFacebook : String?
    let strFanart1 : String?
    let strFanart2 : String?
    let strFanart3 : String?
    let strFanart4 : String?
    let strGender : String?
    let strLeague : String?
    let strLeagueAlternate : String?
    let strLocked : String?
    let strLogo : String?
    let strNaming : String?
    let strPoster : String?
    let strRSS : String?
    let strSport : String?
    let strTrophy : String?
    let strTwitter : String?
    let strWebsite : String?
    let strYoutube : String?
}

