//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 21/02/23.
//

import Foundation
/// Object that represents a single API call
final class RMRequest {
    
    /// Base URL
    private struct Constant {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    /// Desire End point:
    private let endPoint: RMEndPoint
    
    /// Path component for API, if any
    private let pathComponent: [String]
    
    /// Query Arguemnts for Api if any
    private let queryParameter: [URLQueryItem]
    
    /// Constructed url for the api request in string formate
    private var urlString: String {
        var string = Constant.baseURL
        string += "/"
        string += endPoint.rawValue
        if !pathComponent.isEmpty {
            pathComponent.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameter.isEmpty {
            string += "?"
            let arguementString = queryParameter.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += arguementString
        }
        return string
    }
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desire http method
    public let httpMethod = "GET"
    
    //MARK: public
    init(endPoint: RMEndPoint,
         pathComponent: [String] = [],
         queryParameter: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
    }
}
extension RMRequest {
    static let listChracter = RMRequest(endPoint: .character)
}
