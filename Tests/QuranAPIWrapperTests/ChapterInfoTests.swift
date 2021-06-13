//
//  ChapterInfoInfoTests.swift
//  QuranAPIWrapperTests
//
//  Created by Khaled Chehab on 06/06/2021.
//

import XCTest
import QuranAPIWrapper

class ChapterInfoInfoTests: XCTestCase {
    private let chapterInfoListTimeout = 10.0
    
    func testChapterInfoExhaustive() throws {
        let syncValues: [(value: Bool, name: String)] = [(true, "Async"), (false, "Sync")]
        let languages: [(code: String?, name: String)] = [(nil, "Default"), ("en", "English"), ("ar", "Arabic")]
        let assertMessages: [String] = ["Could not find chapter info with id", "There should not be a chapter info with id"]
        var expectationDescription: String
        var assertMessage: String
        var assertNil: Bool
        
        for (syncMode, syncName) in syncValues {
            for (code, name) in languages {
                for id in -1...115 {
                    assertNil = id < 1 || id > 114
                    expectationDescription = "ChapterInfoWithId\(id)\(name)Language\(syncName)"
                    assertMessage = "\(assertNil ? assertMessages[1] : assertMessages[0]) \(id)"
                    
                    if syncMode {
                        try testAsyncChapterInfo(withId: id, andLanguage: code, andExpectationDescription: expectationDescription, shouldAssertNil: assertNil, withAssertMessage: assertMessage)
                    } else {
                        try testSyncChapterInfo(withId: id, andLanguage: code, shouldAssertNil: assertNil, withAssertMessage: assertMessage)
                    }
                }
            }
        }
    }
    
    private func testAsyncChapterInfo(withId id: Int, andLanguage language: String? = nil, andExpectationDescription description: String, shouldAssertNil assertNil: Bool, withAssertMessage message: String) throws {
        let expectation = self.expectation(description: description)
        var chapterInfo: ChapterInfo?
        
        ChapterRequests.getChapterInfo(forId: id, inTheLanguageOf: language) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        
        if assertNil {
            XCTAssertNil(chapterInfo, message)
        } else {
            XCTAssertNotNil(chapterInfo, message)
        }
    }
    
    private func testSyncChapterInfo(withId id: Int, andLanguage language: String? = nil, shouldAssertNil assertNil: Bool, withAssertMessage message: String) throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: id, inTheLanguageOf: language)
        
        if assertNil {
            XCTAssertNil(chapterInfo, message)
        } else {
            XCTAssertNotNil(chapterInfo, message)
        }
    }

}
