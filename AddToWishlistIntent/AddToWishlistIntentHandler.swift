//
//  AddToWishlistIntentHandler.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import Intents

class AddToWishlistIntentHandler : NSObject, AddToWishlistIntentHandling {
    func handle(intent: AddToWishlistIntent, completion: @escaping (AddToWishlistIntentResponse) -> Void) {
        let response = AddToWishlistIntentResponse(code: .success, userActivity: NSUserActivity(activityType: "addToWishlist"))
        completion(response)
    }
}
