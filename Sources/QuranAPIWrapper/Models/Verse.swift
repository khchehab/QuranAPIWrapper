//
//  Verse.swift
//  Created by Khaled Chehab on 10/06/2021.
//

import Foundation

struct Verse: Decodable {
    let id: Int
    let chapterId: Int
    let verseNumber: Int
    let verseKey: String
    let verseIndex: Int
    let textUthmani: String
    let textUthmaniSimple: String
    let textImlaei: String
    let textImlaeiSimple: String
    let textIndopak: String
    let textUthmaniTajweed: String
    let juzNumber: Int
    let hizbNumber: Int
    let rubNumber: Int
    let sajdahType: String
    let sajdahNumber: Int
    let imageUrl: String
    let imageWidth: Int
    let words: [Word]
    let audio: AudioFile
    let translations: [Translation]
    let tafsirs: [Tafsir]
    let codeV1: String
    let codeV2: String
    let v1Page: Int
    let v2Page: Int
}

struct Word: Decodable {
    let id: Int
    let position: Int
    let textUthmani: String
    let textIndopak: String
    let textImlaei: String
    let verseKey: String
    let lineNumber: Int
    let audioUrl: String
    let location: String
    let charTypeName: String
    let codeV1: String
    let codeV2: String
    let translation: Translation
    let transliteration: Transliteration
    let v1Page: Int
    let v2Page: Int
}

struct Translation: Decodable {
    let resourceId: Int
    let resourceName: String
    let id: Int
    let text: String
    let verseId: Int
    let languageId: Int
    let languageName: String
    let verseKey: String
    let chapterId: Int
    let verseNumber: Int
    let juzNumber: Int
    let hizbNumber: Int
    let rubNumber: Int
    let pageNumber: Int
}

struct AudioFile: Decodable {
    let url: String
    let duration: Int
    let format: String
    let segments: [[String]]
}

struct Tafsir: Decodable {
    let id: Int
    let verseId: Int
    let languageId: Int
    let text: String
    let languageName: String
    let resourceName: String
    let verseKey: String
    let chapterId: Int
    let verseNumber: Int
    let juzNnumber: Int
    let hizbNumber: Int
    let rubNumber: Int
    let pageNumber: Int
}
