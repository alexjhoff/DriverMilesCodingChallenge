//
//  DataStore.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/11/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation

struct KeychainConfiguration {
    static let serviceName = "DriverMilesExcercise"
    static let accessGroup: String? = nil
}

final class DataStore {
    
    static let shared = DataStore()
    static let accountName = "uberToken"
    
    private init() { }
    
    func storeToken(_ token: String) {
        do {
            let tokenItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                 account: DataStore.accountName,
                                                 accessGroup: KeychainConfiguration.accessGroup)
            try tokenItem.savePassword(token)
        } catch {
            fatalError("Error updating keychain - \(error)")
        }
    }
    
    func retrieveToken() -> String? {
        do {
            let tokenItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                 account: DataStore.accountName,
                                                 accessGroup: KeychainConfiguration.accessGroup)
            let keychainAccessToken = try tokenItem.readPassword()
            return keychainAccessToken
        }
        catch {
            return nil
        }
    }
}
