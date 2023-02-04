//
//  RMService.swift
//  RickAndMorty
//
//  Created by suraj kumar on 27/01/23.
//
import Foundation
import UIKit
/// primary api service object to get rick and morty data
final class RMService {
    
    /// Shared singlton instance
    static let shared = RMService()
    /// Privatized construnctor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send and Morty Api call
    /// - Parameters:
    ///   - request: Reqeust instance
    ///   - type: the type of object we expect to get back
    ///   - completion: call back with data or error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(RMServiceError.failedToGetData))
                return
                
            }
            //decode the response
            do {    
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
