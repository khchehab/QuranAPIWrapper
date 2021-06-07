//
//  ChapterRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct ChapterRequests {
    private init() {}
    
    // MARK: - List Chapters
    public static func getListOfChapters(inTheLanguageOf language: String = "en", completion: @escaping ([Chapter]?) -> Void) {
        guard let url = RequestHelper.constructURL(withResource: .chapters, andParameter: .language, withValueOf: language) else {
            print("Error failed to construct the url for list of chapters")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: ChapterListResponse.self) { chapterListResponse in
            completion(chapterListResponse?.chapters)
        }
    }
    
    public static func getListOfChapters(inTheLanguageOf language: String = "en") -> [Chapter]? {
        guard let url = RequestHelper.constructURL(withResource: .chapters, andParameter: .language, withValueOf: language) else {
            print("Error failed to construct the url for list of chapters")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: ChapterListResponse.self)
        return response?.chapters
    }
    
    // MARK: - Get Chapter
    public static func getChapter(forId id: Int, inTheLanguageOf language: String = "en", completion: @escaping (Chapter?) -> Void) {
        guard let url = RequestHelper.constructURL(withResource: .chapters, andResourceId: id, andParameter: .language, withValueOf: language) else {
            print("Error failed to construct the url the chapter with id \(id)")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: ChapterResponse.self) { chapterResponse in
            completion(chapterResponse?.chapter)
        }
    }
    
    public static func getChapter(forId id: Int, inTheLanguageOf language: String = "en") -> Chapter? {
        guard let url = RequestHelper.constructURL(withResource: .chapters, andResourceId: id, andParameter: .language, withValueOf: language) else {
            print("Error failed to construct the url the chapter with id \(id)")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: ChapterResponse.self)
        return response?.chapter
    }
    
    // MARK: - Chapter Info
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String = "en", completion: @escaping (ChapterInfo?) -> Void) {
        guard let url = RequestHelper.constructURL(withResource: .chapters, andResourceId: id, andAdditionalResource: .info, andParameter: .language, withValueOf: language) else {
            print("Error failed to construct the url the chapter information with id \(id)")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: ChapterInfoResponse.self) { chapterInfoResponse in
            completion(chapterInfoResponse?.chapterInfo)
        }
    }
    
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String = "en") -> ChapterInfo? {
        guard let url = RequestHelper.constructURL(withResource: .chapters, andResourceId: id, andAdditionalResource: .info, andParameter: .language, withValueOf: language) else {
            print("Error failed to construct the url the chapter information with id \(id)")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: ChapterInfoResponse.self)
        return response?.chapterInfo
    }
}
