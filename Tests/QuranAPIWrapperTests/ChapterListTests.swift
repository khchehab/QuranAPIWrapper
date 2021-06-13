//
//  ChapterListTests.swift
//  QuranAPIWrapperTests
//
//  Created by Khaled Chehab on 06/06/2021.
//

import XCTest
import QuranAPIWrapper

class ChapterListTests: XCTestCase {
    private let chapterListCountExpected = 114
    private let chapterListTimeout = 10.0
    
    func testListOfChaptersExhaustive() throws {
        let syncValues: [(value: Bool, name: String)] = [(true, "Async"), (false, "Sync")]
        let languages: [(code: String?, name: String)] = [(nil, "Default"), ("en", "English"), ("ar", "Arabic")]
        var expectationDescription: String
        
        for (syncMode, syncName) in syncValues {
            for (code, name) in languages {
                expectationDescription = "ListOfChapters\(name)Language\(syncName)"
                
                if syncMode {
                    try testAsyncListOfChapters(inTheLanguageOf: code, andExpectationDescription: expectationDescription)
                } else {
                    try testSyncListOfChapters(inTheLanguageOf: code)
                }
            }
        }
    }
    
    private func testAsyncListOfChapters(inTheLanguageOf language: String? = nil, andExpectationDescription description: String) throws {
        let expectation = self.expectation(description: description)
        var chapters: [Chapter]?
        
        ChapterRequests.getListOfChapters(inTheLanguageOf: language) { obtainedChapters in
            chapters = obtainedChapters
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }
    
    private func testSyncListOfChapters(inTheLanguageOf language: String? = nil) throws {
        let chapters: [Chapter]? = ChapterRequests.getListOfChapters(inTheLanguageOf: language)
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }

}
