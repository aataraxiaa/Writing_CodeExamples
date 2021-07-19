//
//  SwiftConcurrency_AnIntroductionTests.swift
//  SwiftConcurrency_AnIntroductionTests
//
//  Created by Pete Smith on 09/07/2021.
//

import XCTest
@testable import SwiftConcurrency_AnIntroduction

class SwiftConcurrency_AnIntroductionTests: XCTestCase {

    let dataRacer = DataRacer()
    let goodActor = GoodActor()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
            
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataRacer() throws {

        DispatchQueue.concurrentPerform(iterations: 10) { _ in
            self.dataRacer.displayAndUpdate()
        }
    }

    func testGoodActor() throws {

        DispatchQueue.concurrentPerform(iterations: 10) { _ in
            Task {
                await self.goodActor.displayAndUpdate()
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
