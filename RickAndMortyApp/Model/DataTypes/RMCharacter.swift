//
//  RMCharcater.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 18/02/23.
//

import Foundation
struct RMCharcater: Codable {
        let id: Int
        let name: String
        let status: RMCharacterStatus
        let species: String
        let type: String
        let gender: RMCharacterGender
        let origin: RMOrgin
        let location: RMSingleLocation
        let image: String
        let episode: [String]
        let url: String
        let created: String
}
enum RMCharacterStatus: String, Codable {
    case Alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
