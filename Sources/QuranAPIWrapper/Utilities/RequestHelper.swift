//
//  RequestHelper.swift
//  Created by Khaled Chehab on 07/06/2021.
//

import Foundation

struct RequestHelper {
    private init() {}
    
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

class URLBuilder {
    var resourceList: [String]
    var queryStringList: [String: String]
    
    init() {
        self.resourceList = [String]()
        self.queryStringList = [String: String]()
    }
    
    func add(resource: String) -> URLBuilder {
        self.resourceList.append(resource)
        return self
    }
    
    func add(resource: Endpoint) -> URLBuilder {
        return add(resource: resource.rawValue)
    }
    
    func add(resourceId: Int) -> URLBuilder {
        return add(resource: String(resourceId))
    }
    
    func add(queryString key: Parameter, withValue value: String?) -> URLBuilder {
        if let value = value {
            self.queryStringList[key.rawValue] = value
        }
        return self
    }
    
    func build() -> URL? {
        var urlString = "\(QuranAPIConstants.baseUrl)\(QuranAPIConstants.version)"
        
        // append the resources and resource ids to the url string
        for resource in resourceList {
            urlString.append("/")
            urlString.append(resource)
        }
        
        // check if there are query strings to add, append first a question mark then add the query parameters
        if !queryStringList.isEmpty {
            urlString.append("?")
            
            var first: Bool = true
            for (key, value) in queryStringList {
                if !first {
                    urlString.append("&")
                } else {
                    first = false
                }
                
                urlString.append(key)
                urlString.append("=")
                urlString.append(value)
            }
        }
        
        return URL(string: urlString)
    }
}
