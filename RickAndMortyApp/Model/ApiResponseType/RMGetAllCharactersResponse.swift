//
//  RMGetAllCharactersResponse.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 22/02/23.
//

import Foundation
struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String
    }
    let info: Info
    let results: [RMCharcater]
}

