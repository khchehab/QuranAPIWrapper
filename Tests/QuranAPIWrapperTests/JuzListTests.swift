//
//  JuzListTests.swift
//  QuranAPIWrapperTests
//
//  Created by Khaled Chehab on 07/06/2021.
//

import XCTest
import QuranAPIWrapper

class JuzListTests: XCTestCase {
    private let juzListCountExpected = 30
    private let juzListTimeout = 10.0

    func testListOfJuzsAsync() throws {
        let expectation = self.expectation(description: "ListOfJuzsAsync")
        var juzs: [Juz]?
        
        JuzRequests.getListOfJuzs { juzList in
            juzs = juzList
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: juzListTimeout, handler: nil)
        XCTAssertEqual(juzs?.count, juzListCountExpected, "Wrong number of juzs")
    }
    
    func testListOfJuzsSync() throws {
        let juzs = JuzRequests.getListOfJuzs()
        XCTAssertEqual(juzs?.count, juzListCountExpected, "Wrong number of juzs")
    }

}
