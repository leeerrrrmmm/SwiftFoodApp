//
//  UserStorage.swift
//  FoodDeliveryApp
//
//  Created by .Leeerrrmmm . on 11.08.2025.
//

import UIKit

class UserStorage {
    
    static let shared = UserStorage()
    
    
    var passedOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: "passedOnboarding")
        }
        set {
            UserDefaults.standard.set( newValue, forKey: "passedOnboarding")
        }
    }
}
