//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by suraj kumar on 27/01/23.
//

import Foundation
/// Represent the Unique API end point
@frozen enum RMEndpoint: String {
    ///end point to get character info
    case character
    ///end point to get location info
    case location
    ///end point to get episode info
    case episode
    
}
