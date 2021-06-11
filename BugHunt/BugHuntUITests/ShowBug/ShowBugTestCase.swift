//
//  ShowBugTestCase.swift
//  BugHuntUITests
//
//  Created by Pete Smith on 11/06/2021.
//

import Foundation

final class ShowBugTestCase: BaseTestCase {

    let  showBugRobot = ShowBugRobot()

    func testshowBugButtonsDisplaysAlert() {
        // When
        showBugRobot
            .tapShowBugButton()

        // Then
        showBugRobot
            .assertShowBugAlertMessageDisplayed()
    }
}
