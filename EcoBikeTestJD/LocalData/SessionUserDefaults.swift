//
//  SessionUserDefaults.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 22/10/24.
//

import Foundation
struct SessionUserDefaults {
    @UserDefault(key: "isSession", defaultValue: false)
    static var isSession: Bool
}
