//
//  Verse.swift
//  Created by Khaled Chehab on 07/06/2021.
//

import Foundation

public struct Verse: Decodable {
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
    let sajdahType: Int // type is null?????
    let sajdahNumber: Int // type is null?????
    let pageNumber: Int
    let imageUrl: String
    let imageWidth: Int
    let words: [Word]
    let audio: AudioFile
    let translations: [Translation]
    let codeV1: String
    let codeV2: String
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

struct Word: Decodable {
    let id: Int
    let position: Int
    let textUthmani: String
    let textIndopak: String
    let textImlaei: String
    let verseKey: String
    let pageNumber: Int
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

struct AudioFile: Decodable {
    let url: String
    let duration: Int
    let format: String
//    let segments: // array of what? it is not specified
}
