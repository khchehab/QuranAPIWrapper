//
//  ChapterTests.swift
//  QuranAPIWrapperTests
//
//  Created by Khaled Chehab on 06/06/2021.
//

import XCTest
import QuranAPIWrapper

class ChapterTests: XCTestCase {
    private let chapterListTimeout = 10.0
    
    func testChapterExhaustive() throws {
        let syncValues: [(value: Bool, name: String)] = [(true, "Async"), (false, "Sync")]
        let languages: [(code: String?, name: String)] = [(nil, "Default"), ("en", "English"), ("ar", "Arabic")]
        let assertMessages: [String] = ["Could not find chapter with id", "There should not be a chapter with id"]
        var expectationDescription: String
        var assertMessage: String
        var assertNil: Bool
        
        for (syncMode, syncName) in syncValues {
            for (code, name) in languages {
                for id in -1...115 {
                    assertNil = id < 1 || id > 114
                    expectationDescription = "ChapterWithId\(id)\(name)Language\(syncName)"
                    assertMessage = "\(assertNil ? assertMessages[1] : assertMessages[0]) \(id)"
                    
                    if syncMode {
                        try testAsyncChapter(withId: id, andLanguage: code, andExpectationDescription: expectationDescription, shouldAssertNil: assertNil, withAssertMessage: assertMessage)
                    } else {
                        try testSyncChapter(withId: id, andLanguage: code, shouldAssertNil: assertNil, withAssertMessage: assertMessage)
                    }
                }
            }
        }
    }
    
    private func testAsyncChapter(withId id: Int, andLanguage language: String? = nil, andExpectationDescription description: String, shouldAssertNil assertNil: Bool, withAssertMessage message: String) throws {
        let expectation = self.expectation(description: description)
        var chapter: Chapter?
        
        ChapterRequests.getChapter(forId: id, inTheLanguageOf: language) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        
        if assertNil {
            XCTAssertNil(chapter, message)
        } else {
            XCTAssertNotNil(chapter, message)
        }
    }
    
    private func testSyncChapter(withId id: Int, andLanguage language: String? = nil, shouldAssertNil assertNil: Bool, withAssertMessage message: String) throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: id, inTheLanguageOf: language)
        
        if assertNil {
            XCTAssertNil(chapter, message)
        } else {
            XCTAssertNotNil(chapter, message)
        }
    }

}
