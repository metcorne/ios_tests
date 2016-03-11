//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import TestApp

class TestAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        OHHTTPStubs.removeAllStubs()
    }
    
    func testBackend() {
        //Given
        let expectation = expectationWithDescription("findByTitle")
        
        let repository = Repository()
        let service: Service = Service(repository: repository)
        
        //When
        var mediaItem : MediaItem? = nil
        service.findByTitle("Rick & Morty") { (fetchedMediaItem:MediaItem?) in
            mediaItem = fetchedMediaItem
            
            expectation.fulfill()
        }
        
        //Then
        self.waitForExpectationsWithTimeout(5) { _ in
        }
        
        XCTAssertNotNil(mediaItem)
        XCTAssertEqual(mediaItem!.title, "Rick and Morty")
    }
    
    func testMocked() {
        //Given
        let expectation = expectationWithDescription("findByTitle")
        
        let repository = MockRepository()
        let service: Service = Service(repository: repository)
        
        //When
        var mediaItem : MediaItem? = nil
        service.findByTitle("Rick & Morty") { (fetchedMediaItem:MediaItem?) in
            mediaItem = fetchedMediaItem
            
            expectation.fulfill()
        }
        
        //Then
        self.waitForExpectationsWithTimeout(5) { _ in
        }
        
        XCTAssertNotNil(mediaItem)
        XCTAssertEqual(mediaItem!.title, "Rick and Morty")
    }
    
    func testMocked500() {
        //Given
        let expectation = expectationWithDescription("findByTitle")
        
        let repository = MockRepository500()
        let service: Service = Service(repository: repository)
        
        //When
        var mediaItem : MediaItem? = nil
        service.findByTitle("Rick & Morty") { (fetchedMediaItem:MediaItem?) in
            mediaItem = fetchedMediaItem
            
            expectation.fulfill()
        }
        
        //Then
        self.waitForExpectationsWithTimeout(5) { _ in
        }
        
        XCTAssertNil(mediaItem)
    }
    
    func testStubbed() {
        //Given
        let expectation = expectationWithDescription("findByTitle")
        
        // http response stub
        stub({ (urlRequest: NSURLRequest) -> Bool in
            return urlRequest.URL?.absoluteString == "http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=Rick%20&%20Morty"
        }) { _ in
            //load the stubbed_200.json file
            let stubPath = OHPathForFile("stubbed_200.json", self.dynamicType)
            
            //and return it with a couple of headers
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        let repository = Repository()
        let service: Service = Service(repository: repository)
        
        //When
        var mediaItem : MediaItem? = nil
        service.findByTitle("Rick & Morty") { (fetchedMediaItem:MediaItem?) in
            mediaItem = fetchedMediaItem
            
            expectation.fulfill()
        }
        
        //Then
        self.waitForExpectationsWithTimeout(5) { _ in
        }
        
        XCTAssertNotNil(mediaItem)
        XCTAssertEqual(mediaItem!.title, "Rick and Morty")
    }
    
    func testStubbed_500() {
        //Given
        let expectation = expectationWithDescription("findByTitle")
        
        // http response stub
        stub(isMethodGET()) { _ in
            //return error http code 500 without body
            return OHHTTPStubsResponse(fileAtPath: "", statusCode: 500, headers: nil)
        }
        
        let repository = Repository()
        let service: Service = Service(repository: repository)
        
        //When
        var mediaItem : MediaItem? = nil
        service.findByTitle("Rick & Morty") { (fetchedMediaItem:MediaItem?) in
            mediaItem = fetchedMediaItem
            
            expectation.fulfill()
        }
        
        //Then
        self.waitForExpectationsWithTimeout(5) { _ in
        }
        
        XCTAssertNil(mediaItem)
    }
    
}
