//
//  Juz.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct Juz: Decodable {
    let id: Int
    let juzNumber: Int
    let firstVerseId: Int
    let lastVerseId: Int
    let versesCount: Int
    let verseMapping: [String: String]
}

struct JuzListResponse: Decodable {
    let juzs: [Juz]
}
