//
//  Constants.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

struct QuranAPIConstants {
    private init() {}
    
    static let baseUrl = "https://api.quran.com/api"
    static let version = "/v4"
}

enum Endpoint: String {
    case chapters, juzs, verses,
         info, by_chapter
}

enum Parameter: String {
    case language
}
