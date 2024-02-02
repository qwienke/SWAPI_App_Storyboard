//
//  GetPeopleInfo.swift
//  SWAPI_App_Storyboard
//
//  Created by Quinn Wienke on 2/1/24.
//

import Foundation

struct GetPeopleInfo: Codable {
    var results: [NewPeopleInfo]
}

struct NewPeopleInfo: Codable {
    var name: String
    var height: String
    var birthYear: String
    var homeworld: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case birthYear = "birth_year"
        case homeworld = "homeworld"
        
    }
}
