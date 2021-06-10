//
//  ChapterRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct ChapterRequests {
    private init() {}
    
    // TODO: Refactor the url building to include them in an enum with parameters in order not to repeat building the same url for async and sync functions
    // for this request struct and the remaining requests
    
    // MARK: - List Chapters
    public static func getListOfChapters(inTheLanguageOf language: String? = nil, completion: @escaping ([Chapter]?) -> Void) {
        RequestHelper.fetchRequest(for: ChapterURL.chapterList(withLanguage: language), ofType: ChapterListResponse.self) { chapterListResponse in
            completion(chapterListResponse?.chapters)
        }
    }
    
    public static func getListOfChapters(inTheLanguageOf language: String? = nil) -> [Chapter]? {
        let response = RequestHelper.fetchRequest(for: ChapterURL.chapterList(withLanguage: language), ofType: ChapterListResponse.self)
        return response?.chapters
    }
    
    // MARK: - Get Chapter
    public static func getChapter(forId id: Int, inTheLanguageOf language: String? = nil, completion: @escaping (Chapter?) -> Void) {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: ChapterURL.chapter(withId: id, andLanguage: language), ofType: ChapterResponse.self) { chapterResponse in
            completion(chapterResponse?.chapter)
        }
    }
    
    public static func getChapter(forId id: Int, inTheLanguageOf language: String? = nil) -> Chapter? {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: ChapterURL.chapter(withId: id, andLanguage: language), ofType: ChapterResponse.self)
        return response?.chapter
    }
    
    // MARK: - Chapter Info
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String? = nil, completion: @escaping (ChapterInfo?) -> Void) {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: ChapterURL.chapterInfo(withId: id, andLanguage: language), ofType: ChapterInfoResponse.self) { chapterInfoResponse in
            completion(chapterInfoResponse?.chapterInfo)
        }
    }
    
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String? = nil) -> ChapterInfo? {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: ChapterURL.chapterInfo(withId: id, andLanguage: language), ofType: ChapterInfoResponse.self)
        return response?.chapterInfo
    }
}
