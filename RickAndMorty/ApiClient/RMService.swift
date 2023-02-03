//
//  RMService.swift
//  RickAndMorty
//
//  Created by suraj kumar on 27/01/23.
//

import Foundation
/// primary api service object to get rick and morty data
final class RMSerice {
    
    /// Shared singlton instance
    static let shared = RMSerice()
    /// Privatized construnctor
    private init() {}
    
    
    /// Send and Morty Api call
    /// - Parameters:
    ///   - request: Reqeust instance
    ///   - completion: call back with data or error
    public func execute(_ request: RMRequest, completion: @escaping (Result<String, Error>) -> Void) {
        
    }
}
