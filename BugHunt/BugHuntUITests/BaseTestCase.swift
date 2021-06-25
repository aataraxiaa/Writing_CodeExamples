//
//  BaseTestCase.swift
//  BugHuntUITests
//
//  Created by Pete Smith on 11/06/2021.
//

import XCTest

let app = XCUIApplication()

class BaseTestCase: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
}
