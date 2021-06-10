//
//  JuzRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct JuzRequests {
    private init() {}
    
    // MARK: - Get All Juzs
    public static func getListOfJuzs(completion: @escaping ([Juz]?) -> Void) {
        RequestHelper.fetchRequest(for: JuzURL.juzList(), ofType: JuzListResponse.self) { juzListResponse in
            completion(juzListResponse?.juzs)
        }
    }
    
    public static func getListOfJuzs() -> [Juz]? {
        let response = RequestHelper.fetchRequest(for: JuzURL.juzList(), ofType: JuzListResponse.self)
        return response?.juzs
    }
}
