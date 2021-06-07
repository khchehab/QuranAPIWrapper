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

    func testChapterWithIdOneDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdOneDefaultLanguageParameterAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 1) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNotNil(chapter, "Could not find chapter with id 1")
    }
    
    func testChapterWithIdOneHundredAndFourteenDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdOneHundredAndFourteenDefaultLanguageParameterAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 114) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNotNil(chapter, "Could not find chapter with id 114")
    }
    
    func testChapterWithExistingIdDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterWithExistingIdDefaultLanguageParameterAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 20) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNotNil(chapter, "Could not find chapter with id 20")
    }
    
    func testChapterWithIdOneEnglishLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdOneEnglishLanguageAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 1, inTheLanguageOf: "en") { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNotNil(chapter, "Could not find chapter with id 1")
    }
    
    func testChapterWithIdOneArabicLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdOneArabicLanguageAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 1, inTheLanguageOf: "ar") { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNotNil(chapter, "Could not find chapter with id 1")
    }
    
    func testChapterWithIdZeroDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdZeroDefaultLanguageParameterAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 0) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNil(chapter, "There should not be a chapter with id 0")
    }
    
    func testChapterWithIdNegativeDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdNegativeDefaultLanguageParameterAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: -1) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNil(chapter, "There should not be a chapter with negative id")
    }
    
    func testChapterWithIdGreaterThanOneHundredAndFourteenDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdGreaterThanOneHundredAndFourteenDefaultLanguageParameterAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 115) { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNil(chapter, "There should not be a chapter with id greater than 114")
    }
    
    func testChapterWithIdZeroEnglishLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdZeroEnglishLanguageAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 0, inTheLanguageOf: "en") { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNil(chapter, "There should not be a chapter with id 0")
    }
    
    func testChapterWithIdZeroArabicLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterWithIdZeroArabicLanguageAsync")
        var chapter: Chapter?

        ChapterRequests.getChapter(forId: 0, inTheLanguageOf: "ar") { obtainedChapter in
            chapter = obtainedChapter
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterListTimeout, handler: nil)
        XCTAssertNil(chapter, "There should not be a chapter with id 0")
    }
    
    func testChapterWithIdOneDefaultLanguageParameterSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 1)
        XCTAssertNotNil(chapter, "Could not find chapter with id 1")
    }
    
    func testChapterWithIdOneHundredAndFourteenDefaultLanguageParameterSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 114)
        XCTAssertNotNil(chapter, "Could not find chapter with id 114")
    }
    
    func testChapterWithExistingIdDefaultLanguageParameterSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 20)
        XCTAssertNotNil(chapter, "Could not find chapter with id 20")
    }
    
    func testChapterWithIdOneEnglishLanguageSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 1, inTheLanguageOf: "en")
        XCTAssertNotNil(chapter, "Could not find chapter with id 1")
    }
    
    func testChapterWithIdOneArabicLanguageSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 1, inTheLanguageOf: "ar")
        XCTAssertNotNil(chapter, "Could not find chapter with id 1")
    }
    
    func testChapterWithIdZeroDefaultLanguageParameterSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 0)
        XCTAssertNil(chapter, "There should not be a chapter with id 0")
    }
    
    func testChapterWithIdNegativeDefaultLanguageParameterSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: -1)
        XCTAssertNil(chapter, "There should not be a chapter with negative id")
    }
    
    func testChapterWithIdGreaterThanOneHundredAndFourteenDefaultLanguageParameterSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 115)
        XCTAssertNil(chapter, "There should not be a chapter with id greater than 114")
    }
    
    func testChapterWithIdZeroEnglishLanguageSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 0, inTheLanguageOf: "en")
        XCTAssertNil(chapter, "There should not be a chapter with id 0")
    }
    
    func testChapterWithIdZeroArabicLanguageSync() throws {
        let chapter: Chapter? = ChapterRequests.getChapter(forId: 0, inTheLanguageOf: "ar")
        XCTAssertNil(chapter, "There should not be a chapter with id 0")
    }

}
