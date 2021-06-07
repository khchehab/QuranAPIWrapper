//
//  RequestHelper.swift
//  Created by Khaled Chehab on 07/06/2021.
//

import Foundation

struct RequestHelper {
    private init() {}
    
    static func constructURL(withResource resource: Endpoint, andResourceId resourceId: Int? = nil, andAdditionalResource additionalResource: Endpoint? = nil, andParameter parameter: Parameter? = nil, withValueOf parameterValue: String? = nil) -> URL? {
        return URL(string: "\(QuranAPIConstants.baseUrl)\(QuranAPIConstants.version)/\(resource)\(resourceId == nil ? "" : "/\(resourceId!)")\(additionalResource == nil ? "" : "/\(additionalResource!)")\(parameter == nil ? "" : "?\(parameter!)=\(parameterValue!)")")
    }
    
    static func fetchRequest<T: Decodable>(for url: URL, ofType type: T.Type, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print("Error fetching the request for url \(url): \(e)")
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let response = try jsonDecoder.decode(T.self, from: data)
                    completion(response)
                } catch {
                    print("Error decoding the fetched response for url \(url): \(error)")
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
    
    static func fetchRequest<T: Decodable>(for url: URL, ofType type: T.Type) -> T? {
        var isDone: Bool = false
        var response: T?
        fetchRequest(for: url, ofType: type) { obtainedResponse in
            if let obtainedResponse = obtainedResponse {
                response = obtainedResponse
            } else {
                response = nil
            }
            isDone = true
        }
        while !isDone {}
        return response
    }
}
