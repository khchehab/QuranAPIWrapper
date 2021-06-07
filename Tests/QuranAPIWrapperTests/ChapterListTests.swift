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
    
    func testListOfChaptersDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ListOfChaptersDefaultLanguageParameterAsync")
        var chapters: [Chapter]?
        
        ChapterRequests.getListOfChapters { chapterList in
            chapters = chapterList
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }
    
    func testListOfChaptersEnglishLanguageAsync() throws {
        let expectation = self.expectation(description: "ListOfChaptersEnglishLanguageAsync")
        var chapters: [Chapter]?
        
        ChapterRequests.getListOfChapters(inTheLanguageOf: "en") { chapterList in
            chapters = chapterList
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }
    
    func testListOfChaptersArabicLanguageAsync() throws {
        let expectation = self.expectation(description: "ListOfChaptersArabicLanguageAsync")
        var chapters: [Chapter]?
        
        ChapterRequests.getListOfChapters(inTheLanguageOf: "ar") { chapterList in
            chapters = chapterList
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }
    
    func testListOfChaptersDefaultLanguageParameterSync() throws {
        let chapters = ChapterRequests.getListOfChapters()
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }
    
    func testListOfChaptersEnglishLanguageSync() throws {
        let chapters = ChapterRequests.getListOfChapters(inTheLanguageOf: "en")
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }
    
    func testListOfChaptersArabicLanguageSync() throws {
        let chapters = ChapterRequests.getListOfChapters(inTheLanguageOf: "ar")
        XCTAssertEqual(chapters?.count, chapterListCountExpected, "Wrong number of chapters")
    }

}
