//
//  VentunoPOCTests.swift
//  VentunoPOCTests
//
//  Created by Good on 30/10/20.
//  Copyright © 2020 Mobileapps. All rights reserved.
//

import XCTest
@testable import VentunoPOC

class VentunoPOCTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAllWordsLoaded(){
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 0, "allWords must be 0")

    }
    
    func testInitialization() {
        let person = Person(first: "Bart", last: "Jacobs")
        XCTAssertNotNil(person)
        XCTAssertEqual(person.first, "Bart")
        XCTAssertEqual(person.last, "Jacobs")
    }

    func testFullName() {
        let person = Person(first: "Bart", last: "Jacobs")

        XCTAssertEqual(person.fullName, "Bart Jacobs")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
