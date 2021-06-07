//
//  JuzRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct JuzRequests {
    private init() {}
    
    // MARK: - Get All Juzs
    public static func getListOfJuzs(completion: @escaping ([Juz]?) -> Void) {
        guard let url = RequestHelper.constructURL(withResource: .juzs) else {
            print("Error failed to construct the url for list of juzs")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print("Error fetching the list of juzs: \(e)")
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let juzsResponse = try jsonDecoder.decode(JuzListResponse.self, from: data)
                    completion(juzsResponse.juzs)
                } catch {
                    print("Error decoding the list of juzs response: \(error)")
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
    
    public static func getListOfJuzs() -> [Juz]? {
        var isDone: Bool = false
        var juzs: [Juz]?
        getListOfJuzs { juzList in
            if let juzList = juzList {
                juzs = juzList
            } else {
                juzs = nil
            }
            isDone = true
        }
        while !isDone {}
        return juzs
    }
}
