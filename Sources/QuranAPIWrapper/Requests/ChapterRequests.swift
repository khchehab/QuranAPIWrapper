//
//  ChapterRequests.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

public struct ChapterRequests {
    private init() {}
    
    // MARK: - List Chapters
    public static func getListOfChapters(inTheLanguageOf language: String = "en", completion: @escaping ([Chapter]?) -> Void) {
        let urlString = "\(Constants.QuranAPI.baseUrl)\(Constants.QuranAPI.version)\(Constants.QuranAPI.Endpoints.chapters)?\(Constants.QuranAPI.Parameters.language)=\(language)"
        guard let url = URL(string: urlString) else {
            print("Error failed to construct the url for list of chapters")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print("Error fetching the list of chapters: \(e)")
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let chaptersResponse = try jsonDecoder.decode(ChapterListResponse.self, from: data)
                    completion(chaptersResponse.chapters)
                } catch {
                    print("Error decoding the list of chapters response: \(error)")
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
    
    public static func getListOfChapters(inTheLanguageOf language: String = "en") -> [Chapter]? {
        var isDone: Bool = false
        var chapters: [Chapter]?
        getListOfChapters(inTheLanguageOf: language) { chapterList in
            if let chapterList = chapterList {
                chapters = chapterList
            } else {
                chapters = nil
            }
            isDone = true
        }
        while !isDone {}
        return chapters
    }
    
    // MARK: - Get Chapter
    public static func getChapter(forId id: Int, inTheLanguageOf language: String = "en", completion: @escaping (Chapter?) -> Void) {
        let urlString = "\(Constants.QuranAPI.baseUrl)\(Constants.QuranAPI.version)\(Constants.QuranAPI.Endpoints.chapters)/\(id)?\(Constants.QuranAPI.Parameters.language)=\(language)"
        guard let url = URL(string: urlString) else {
            print("Error failed to construct the url the chapter with id \(id)")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print("Error fetching the chapter with id \(id): \(e)")
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let chapterResponse = try jsonDecoder.decode(ChapterResponse.self, from: data)
                    completion(chapterResponse.chapter)
                } catch {
                    print("Error decoding the chapter with id \(id) response: \(error)")
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
    
    public static func getChapter(forId id: Int, inTheLanguageOf language: String = "en") -> Chapter? {
        var isDone: Bool = false
        var chapter: Chapter?
        getChapter(forId: id, inTheLanguageOf: language) { obtainedChapter in
            if let obtainedChapter = obtainedChapter {
                chapter = obtainedChapter
            } else {
                chapter = nil
            }
            isDone = true
        }
        while !isDone {}
        return chapter
    }
    
    // MARK: - Chapter Info
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String = "en", completion: @escaping (ChapterInfo?) -> Void) {
        let urlString = "\(Constants.QuranAPI.baseUrl)\(Constants.QuranAPI.version)\(Constants.QuranAPI.Endpoints.chapters)/\(id)\(Constants.QuranAPI.Endpoints.info)?\(Constants.QuranAPI.Parameters.language)=\(language)"
        guard let url = URL(string: urlString) else {
            print("Error failed to construct the url the chapter information with id \(id)")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print("Error fetching the chapter information with id \(id): \(e)")
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let chapterInfoResponse = try jsonDecoder.decode(ChapterInfoResponse.self, from: data)
                    completion(chapterInfoResponse.chapterInfo)
                } catch {
                    print("Error decoding the chapter information with id \(id) response: \(error)")
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
    
    public static func getChapterInfo(forId id: Int, inTheLanguageOf language: String = "en") -> ChapterInfo? {
        var isDone: Bool = false
        var chapterInfo: ChapterInfo?
        getChapterInfo(forId: id, inTheLanguageOf: language) { obtainedChapterInfo in
            if let obtainedChapterInfo = obtainedChapterInfo {
                chapterInfo = obtainedChapterInfo
            } else {
                chapterInfo = nil
            }
            isDone = true
        }
        while !isDone {}
        return chapterInfo
    }
}
