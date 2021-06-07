//
//  JuzRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct JuzRequests {
    private init() {}
    
    // MARK: - Get All Juzs
    public static func getListOfJuzs(completion: @escaping ([Juz]?) -> Void) {
        guard let url = URLBuilder().add(resource: .juzs).build() else {
            print("Error failed to construct the url for list of juzs")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: JuzListResponse.self) { juzListResponse in
            completion(juzListResponse?.juzs)
        }
    }
    
    public static func getListOfJuzs() -> [Juz]? {
        guard let url = URLBuilder().add(resource: .juzs).build() else {
            print("Error failed to construct the url for list of juzs")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: JuzListResponse.self)
        return response?.juzs
    }
}
