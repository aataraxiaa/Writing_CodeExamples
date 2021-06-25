//
//  ShowBugPage.swift
//  BugHuntUITests
//
//  Created by Pete Smith on 11/06/2021.
//

import XCTest

struct ShowBugPage {

    enum Identifiers {
        static let showBugButton = "Show me a bug"
        static let showBugAlertMessage = "This is a bug 🐛"
        static let showBugAlertOkButton = "Ok"
    }

    enum Buttons {
        static let showBugButton =  app.buttons[Identifiers.showBugButton]
        static let okButton = app.buttons[Identifiers.showBugAlertOkButton]
    }

    enum Alerts {
        static let showBugAlertMessage =  app.staticTexts[Identifiers.showBugAlertMessage]
    }
}
