//
//  Chapter.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct Chapter: Decodable {
    let id: Int
    let revelationPlace: String
    let revelationOrder: Int
    let bismillahPre: Bool
    let nameComplex: String
    let nameArabic: String
    let versesCount: Int
    let pages: [Int]
    let translatedName: TranslatedName
}

public struct ChapterInfo: Decodable {
    let chapterId: Int
    let text: String
    let shortText: String
    let languageName: String
    let source: String
}

class ChapterListResponse: Decodable {
    let chapters: [Chapter]
}

struct ChapterResponse: Decodable {
    let chapter: Chapter
}

struct ChapterInfoResponse: Decodable {
    let chapterInfo: ChapterInfo
}
