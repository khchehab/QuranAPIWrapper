//
//  ChapterRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct ChapterRequests {
    private init() {}
    
    // MARK: - List Chapters
    public static func getListOfChapters(inTheLanguageOf language: String? = nil, completion: @escaping ([Chapter]?) -> Void) {
        guard let url = URLBuilder().add(resource: .chapters).add(queryString: .language, withValue: language).build() else {
            print("Error failed to construct the url for list of chapters")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: ChapterListResponse.self) { chapterListResponse in
            completion(chapterListResponse?.chapters)
        }
    }
    
    public static func getListOfChapters(inTheLanguageOf language: String? = nil) -> [Chapter]? {
        guard let url = URLBuilder().add(resource: .chapters).add(queryString: .language, withValue: language).build() else {
            print("Error failed to construct the url for list of chapters")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: ChapterListResponse.self)
        return response?.chapters
    }
    
    // MARK: - Get Chapter
    public static func getChapter(forId id: Int, inTheLanguageOf language: String? = nil, completion: @escaping (Chapter?) -> Void) {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            completion(nil)
            return
        }
        
        guard let url = URLBuilder().add(resource: .chapters).add(resourceId: id).add(queryString: Parameter.language, withValue: language).build() else {
            print("Error failed to construct the url the chapter with id \(id)")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: ChapterResponse.self) { chapterResponse in
            completion(chapterResponse?.chapter)
        }
    }
    
    public static func getChapter(forId id: Int, inTheLanguageOf language: String? = nil) -> Chapter? {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            return nil
        }
        
        guard let url = URLBuilder().add(resource: .chapters).add(resourceId: id).add(queryString: Parameter.language, withValue: language).build() else {
            print("Error failed to construct the url the chapter with id \(id)")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: ChapterResponse.self)
        return response?.chapter
    }
    
    // MARK: - Chapter Info
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String? = nil, completion: @escaping (ChapterInfo?) -> Void) {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            completion(nil)
            return
        }
        
        guard let url = URLBuilder().add(resource: .chapters).add(resourceId: id).add(resource: .info).add(queryString: .language, withValue: language).build() else {
            print("Error failed to construct the url the chapter information with id \(id)")
            completion(nil)
            return
        }
        
        RequestHelper.fetchRequest(for: url, ofType: ChapterInfoResponse.self) { chapterInfoResponse in
            completion(chapterInfoResponse?.chapterInfo)
        }
    }
    
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String? = nil) -> ChapterInfo? {
        if id < QuranAPIConstants.chapterMinimumNumber || id > QuranAPIConstants.chapterMaximumNumber {
            print("Invalid id, it should be between [\(QuranAPIConstants.chapterMinimumNumber), \(QuranAPIConstants.chapterMaximumNumber)]")
            return nil
        }
        
        guard let url = URLBuilder().add(resource: .chapters).add(resourceId: id).add(resource: .info).add(queryString: .language, withValue: language).build() else {
            print("Error failed to construct the url the chapter information with id \(id)")
            return nil
        }
        
        let response = RequestHelper.fetchRequest(for: url, ofType: ChapterInfoResponse.self)
        return response?.chapterInfo
    }
}
