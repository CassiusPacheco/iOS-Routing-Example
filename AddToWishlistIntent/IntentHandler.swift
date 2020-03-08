//
//  IntentHandler.swift
//  AddToWishlistIntent
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        guard intent is AddToWishlistIntent else { fatalError("Unhandled intent type: \(intent)") }
        return AddToWishlistIntentHandler()
    }
}
