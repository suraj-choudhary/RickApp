//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by suraj kumar on 27/01/23.
//
import Foundation
/// Object that represent a single api call
final class RMRequest {
    //base url
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    let endPoint: RMEndpoint
    
    private let pathComponent: [String]
    private let queryParameter: [URLQueryItem]
    
//    constructed url for the api request in format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        if !pathComponent.isEmpty {
            string += "/"
            pathComponent.forEach({
                string += "\($0)"
            })
        }
        if !queryParameter.isEmpty {
            string += "?"
            
            //name=value&name=value
            let arguementString = queryParameter.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            pathComponent.forEach({
                string += "\($0)"
            })
            
            string += arguementString
        }
        return string
    }
    public var url: URL? {
        return URL(string: urlString)
        
    }
    
    public init(endPoint: RMEndpoint, pathComponet: [String] = [], queryParameter: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponent = pathComponet
        self.queryParameter = queryParameter
    }
}
// end point
//path component
//queryItem

