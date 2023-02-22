//
//  RMEndPoint.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 21/02/23.
//

import Foundation
/// Represents unique API endpoint
@frozen enum RMEndPoint: String {
    ///EndPoint to get Character
    case character
    ///endPoint to get location
    case location
    ///endPoint to get episode
    case episode
}
