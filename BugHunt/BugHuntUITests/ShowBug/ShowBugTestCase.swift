//
//  ShowBugTestCase.swift
//  BugHuntUITests
//
//  Created by Pete Smith on 11/06/2021.
//

final class ShowBugTestCase: BaseTestCase {

    let  showBugRobot = ShowBugRobot()

    func testShowBugButtonsDisplaysAlert() {
        // When
        showBugRobot
            .tapShowBugButton()

        // Then
        showBugRobot
            .assertShowBugAlertMessageDisplayed()
    }

    func testShowBugAlertOkButtonDismissesAlert() {
        // When
        showBugRobot.tapShowBugButton().tapShowBugAlertOkButton()

        // Then
        showBugRobot
            .assertShowBugAlertMessageNotDisplayed()
    }
}
