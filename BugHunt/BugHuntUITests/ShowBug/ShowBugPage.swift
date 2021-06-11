//
//  ShowBugPage.swift
//  BugHuntUITests
//
//  Created by Pete Smith on 11/06/2021.
//

import XCTest

struct ShowBugPage {

    enum Identifiers {
        static let showBugButton = "showBugButton"
        static let showBugAlertMessage = "This is a bug 🐛"
    }

    enum Buttons {
        static let showBugButton =  app.buttons[Identifiers.showBugButton]
    }

    enum Alerts {
        static let showBugAlertMessage =  app.staticTexts[Identifiers.showBugAlertMessage]
    }

}
