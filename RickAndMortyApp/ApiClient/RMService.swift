//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 21/02/23.
//

import Foundation
/// Primary api service object to get Rick and Morty data
final class RMService {
    
    /// Shared singlton instance
    static let shared = RMService()
    
    /// privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData

    }
    /// Send Rick and Morty Api Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: CallBack with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping(Result<T, Error>) -> Void) {
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
                
            }
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                
                guard let data = data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                //decode
                
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    
                    completion(.success(result))
                }catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    // MARK: Private Request method
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
        
    }
}


