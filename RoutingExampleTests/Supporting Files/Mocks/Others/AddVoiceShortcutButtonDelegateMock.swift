//
//  AddVoiceShortcutButtonDelegateMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import IntentsUI
@testable import RoutingExample

class AddVoiceShortcutButtonDelegateMock: NSObject, INUIAddVoiceShortcutButtonDelegate {
    var presentAddVoiceShortcutViewControllerCallsCount = 0
    var presentEditVoiceShortcutViewControllerCallsCount = 0

    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        presentAddVoiceShortcutViewControllerCallsCount += 1
    }

    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        presentEditVoiceShortcutViewControllerCallsCount += 1
    }
}
