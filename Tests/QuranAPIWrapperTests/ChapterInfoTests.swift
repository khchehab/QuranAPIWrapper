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

    func testChapterInfoWithIdOneDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdOneDefaultLanguageParameterAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 1) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 1")
    }
    
    func testChapterInfoWithIdOneHundredAndFourteenDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdOneHundredAndFourteenDefaultLanguageParameterAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 114) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 114")
    }
    
    func testChapterInfoWithExistingIdDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithExistingIdDefaultLanguageParameterAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 20) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 20")
    }
    
    func testChapterInfoWithIdOneEnglishLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdOneEnglishLanguageAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 1, inTheLanguageOf: "en") { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 1")
    }
    
    func testChapterInfoWithIdOneArabicLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdOneArabicLanguageAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 1, inTheLanguageOf: "ar") { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 1")
    }
    
    func testChapterInfoWithIdZeroDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdZeroDefaultLanguageParameterAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 0) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id 0")
    }
    
    func testChapterInfoWithIdNegativeDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdNegativeDefaultLanguageParameterAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: -1) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with negative id")
    }
    
    func testChapterInfoWithIdGreaterThanOneHundredAndFourteenDefaultLanguageParameterAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdGreaterThanOneHundredAndFourteenDefaultLanguageParameterAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 115) { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id greater than 114")
    }
    
    func testChapterInfoWithIdZeroEnglishLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdZeroEnglishLanguageAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 0, inTheLanguageOf: "en") { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id 0")
    }
    
    func testChapterInfoWithIdZeroArabicLanguageAsync() throws {
        let expectation = self.expectation(description: "ChapterInfoWithIdZeroArabicLanguageAsync")
        var chapterInfo: ChapterInfo?

        ChapterRequests.getChapterInfo(forId: 0, inTheLanguageOf: "ar") { obtainedChapterInfo in
            chapterInfo = obtainedChapterInfo
            expectation.fulfill()
        }

        waitForExpectations(timeout: chapterInfoListTimeout, handler: nil)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id 0")
    }
    
    func testChapterInfoWithIdOneDefaultLanguageParameterSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 1)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 1")
    }
    
    func testChapterInfoWithIdOneHundredAndFourteenDefaultLanguageParameterSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 114)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 114")
    }
    
    func testChapterInfoWithExistingIdDefaultLanguageParameterSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 20)
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 20")
    }
    
    func testChapterInfoWithIdOneEnglishLanguageSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 1, inTheLanguageOf: "en")
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 1")
    }
    
    func testChapterInfoWithIdOneArabicLanguageSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 1, inTheLanguageOf: "ar")
        XCTAssertNotNil(chapterInfo, "Could not find chapterInfo with id 1")
    }
    
    func testChapterInfoWithIdZeroDefaultLanguageParameterSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 0)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id 0")
    }
    
    func testChapterInfoWithIdNegativeDefaultLanguageParameterSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: -1)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with negative id")
    }
    
    func testChapterInfoWithIdGreaterThanOneHundredAndFourteenDefaultLanguageParameterSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 115)
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id greater than 114")
    }
    
    func testChapterInfoWithIdZeroEnglishLanguageSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 0, inTheLanguageOf: "en")
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id 0")
    }
    
    func testChapterInfoWithIdZeroArabicLanguageSync() throws {
        let chapterInfo: ChapterInfo? = ChapterRequests.getChapterInfo(forId: 0, inTheLanguageOf: "ar")
        XCTAssertNil(chapterInfo, "There should not be a chapterInfo with id 0")
    }

}
