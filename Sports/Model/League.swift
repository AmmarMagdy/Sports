//
//  League.swift
//  Sports
//
//  Created by Ammar.M on 7/2/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

struct League : Codable {
    
    let leagues : [Leagues]?
}

struct Leagues : Codable {
    
    let idLeague : String?
    let strLeague : String?
    let strLeagueAlternate : String?
    let strSport : String?
}
