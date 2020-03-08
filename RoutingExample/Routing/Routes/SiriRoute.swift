//
//  SiriRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import IntentsUI

protocol SiriRoute: INUIAddVoiceShortcutButtonDelegate {}

extension SiriRouter: SiriRoute {}
