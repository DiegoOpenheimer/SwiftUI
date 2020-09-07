//
//  UserRepository.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 07/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation

enum UserKey: String {
    case time = "@time"
    case changeAutomatic = "@changeAutomatic"
    case schemaColor = "@schemaColor"
}

class UserRepository {
    
    static let shared: UserRepository = UserRepository()
    let userDefaults: UserDefaults
    
    var time: Double {
        get {
            return userDefaults.double(forKey: UserKey.time.rawValue)
        }
        set(value) {
            userDefaults.set(value, forKey: UserKey.time.rawValue)
        }
    }
    
    var changeAutomatic: Bool {
        get {
            return userDefaults.bool(forKey: UserKey.changeAutomatic.rawValue)
        }
        set(value) {
            userDefaults.set(value, forKey: UserKey.changeAutomatic.rawValue)
        }
    }
    
    var schemaColor: SchemaColor {
        get {
            let value = userDefaults.string(forKey: UserKey.schemaColor.rawValue)
            return SchemaColor(rawValue: value!) ?? SchemaColor.LIGHT
        }
        set(value) {
            userDefaults.set(value.rawValue, forKey: UserKey.schemaColor.rawValue)
        }
    }
    
    private init() {
        userDefaults = UserDefaults.standard
        let defaultValues: Dictionary = [
            UserKey.time.rawValue: 3,
            UserKey.changeAutomatic.rawValue: true,
            UserKey.schemaColor.rawValue: SchemaColor.LIGHT.rawValue
            ] as [String : Any]
        userDefaults.register(defaults: defaultValues)
    }
    
}
